"""Litestar application — HTMX-driven trip planning wizard."""

from __future__ import annotations

from pathlib import Path

from litestar import Litestar, Request, get, post
from litestar.contrib.jinja import JinjaTemplateEngine
from litestar.response import Template
from litestar.static_files import create_static_files_router
from litestar.template.config import TemplateConfig

from .data import get_data
from .solver import UserPrefs, plan_trip

BASE = Path(__file__).resolve().parent


def _render(name: str, ctx: dict | None = None) -> Template:
    return Template(template_name=name, context=ctx or {})


@get("/")
async def index() -> Template:
    return _render("index.html")


@post("/step/{n:int}")
async def step(request: Request, n: int) -> Template:
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
    return _render(template, ctx)


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


@post("/plan")
async def plan(request: Request) -> Template:
    form = dict(await request.form())
    prefs = _parse_form(form)
    data = get_data()
    trip = plan_trip(data, prefs)
    return _render("results.html", {
        "trip": trip,
        "form": form,
        "trip_number": 1,
    })


@post("/plan/second")
async def plan_second(request: Request) -> Template:
    form = dict(await request.form())
    prefs = _parse_form(form)
    data = get_data()

    first_trip = plan_trip(data, prefs)
    exclude = {cp.city.id for cp in first_trip.city_plans}
    second_trip = plan_trip(data, prefs, exclude_cities=exclude)

    return _render("results.html", {
        "trip": second_trip,
        "form": form,
        "trip_number": 2,
    })


app = Litestar(
    route_handlers=[
        index,
        step,
        plan,
        plan_second,
        create_static_files_router(path="/static", directories=[BASE / "static"]),
    ],
    template_config=TemplateConfig(
        directory=BASE / "templates",
        engine=JinjaTemplateEngine,
    ),
)
