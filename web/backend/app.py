"""FastAPI application — HTMX-driven trip planning wizard."""

from __future__ import annotations

from pathlib import Path

from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from .data import get_data
from .solver import UserPrefs, plan_trip

BASE = Path(__file__).resolve().parent
app = FastAPI(title="SBC_IA Trip Planner")
app.mount("/static", StaticFiles(directory=BASE / "static"), name="static")
templates = Jinja2Templates(directory=BASE / "templates")


def _render(request: Request, name: str, ctx: dict | None = None):
    context = ctx or {}
    context["request"] = request
    return templates.TemplateResponse(name=name, context=context, request=request)


@app.get("/", response_class=HTMLResponse)
async def index(request: Request):
    return _render(request, "index.html")


@app.post("/step/{n}", response_class=HTMLResponse)
async def step(request: Request, n: int):
    form = await request.form()
    ctx = {"form": dict(form), "step": n}
    step_map = {
        1: "steps/ages.html",
        2: "steps/trip_type.html",
        3: "steps/duration.html",
        4: "steps/days_per_city.html",
        5: "steps/num_cities.html",
        6: "steps/budget.html",
        7: "steps/transport.html",
        8: "steps/hotel_quality.html",
        9: "steps/popularity.html",
        10: "steps/priority.html",
    }
    template = step_map.get(n, "steps/ages.html")
    return _render(request, template, ctx)


def _parse_form(form: dict) -> UserPrefs:
    ages_raw = form.get("ages", "30")
    ages = [int(a.strip()) for a in str(ages_raw).split(",") if a.strip().isdigit()]
    if not ages:
        ages = [30]

    avoid_raw = form.get("avoid_transport", "")
    avoid = [t.strip() for t in str(avoid_raw).split(",") if t.strip()]

    return UserPrefs(
        ages=ages,
        trip_type=str(form.get("trip_type", "cultural")),
        days_min=int(form.get("days_min", 3)),
        days_max=int(form.get("days_max", 10)),
        days_per_city_min=int(form.get("days_per_city_min", 1)),
        days_per_city_max=int(form.get("days_per_city_max", 4)),
        cities_min=int(form.get("cities_min", 1)),
        cities_max=int(form.get("cities_max", 3)),
        budget=float(form.get("budget", 2000)),
        avoid_transport=avoid,
        min_stars=int(form.get("min_stars", 1)),
        prefer_unknown=form.get("prefer_unknown", "false") == "true",
        priority=str(form.get("priority", "mixto")),
    )


@app.post("/plan", response_class=HTMLResponse)
async def plan(request: Request):
    form = dict(await request.form())
    prefs = _parse_form(form)
    data = get_data()
    trip = plan_trip(data, prefs)
    return _render(request, "results.html", {
        "trip": trip,
        "form": form,
        "trip_number": 1,
    })


@app.post("/plan/second", response_class=HTMLResponse)
async def plan_second(request: Request):
    form = dict(await request.form())
    prefs = _parse_form(form)
    data = get_data()

    first_trip = plan_trip(data, prefs)
    exclude = {cp.city.id for cp in first_trip.city_plans}
    second_trip = plan_trip(data, prefs, exclude_cities=exclude)

    return _render(request, "results.html", {
        "trip": second_trip,
        "form": form,
        "trip_number": 2,
    })
