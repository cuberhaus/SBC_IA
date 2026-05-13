"""Litestar application — HTMX-driven trip planning wizard."""

from __future__ import annotations

# ── Phase 14 (Option A) — Sentry SDK + JSON-line stdout (no-op if missing) ─
try:
    from ._sentry_obs import (  # type: ignore[import-not-found]
        init_observability,
        breadcrumb as _crumb,
        span as _span,
        tag as _tag,
        SessionIdMiddleware as _SessionIdMiddleware,
    )

    init_observability(service="sbc-ia")
except ImportError:
    from contextlib import contextmanager

    def _tag(*_a, **_kw):
        return None

    def _crumb(*_a, **_kw):
        return None

    @contextmanager
    def _span(*_a, **_kw):
        yield None

    class _SessionIdMiddleware:  # type: ignore[no-redef]
        def __init__(self, app):
            self.app = app

        async def __call__(self, scope, receive, send):
            await self.app(scope, receive, send)


def _budget_bucket(budget: float) -> str:
    """Three-bucket budget label so Sentry tag cardinality stays bounded."""
    if budget < 1500:
        return "low"
    if budget < 4000:
        return "mid"
    return "high"

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
    _crumb(
        "wizard", f"step {n} submit",
        step=n, template=template, form_keys=list(dict(form).keys()),
    )
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


def _tag_prefs(prefs: UserPrefs, trip_number: int) -> None:
    _tag("trip_type", prefs.trip_type)
    _tag("priority", prefs.priority)
    _tag("budget", _budget_bucket(prefs.budget))
    _tag("n_cities", prefs.cities_max)
    _tag(
        "transport_pref",
        "any" if not prefs.avoid_transport else "+".join(sorted(prefs.avoid_transport)),
    )
    _tag("trip_number", trip_number)


@post("/plan")
async def plan(request: Request) -> Template:
    form = dict(await request.form())
    prefs = _parse_form(form)
    _tag_prefs(prefs, trip_number=1)
    _crumb(
        "wizard", "primary plan submit",
        trip_type=prefs.trip_type, priority=prefs.priority,
        budget_bucket=_budget_bucket(prefs.budget),
        cities=f"{prefs.cities_min}-{prefs.cities_max}",
    )
    data = get_data()
    with _span(
        "expert.plan",
        description="primary itinerary search",
        trip_type=prefs.trip_type, priority=prefs.priority,
        cities_max=prefs.cities_max,
    ):
        trip, reasoning = plan_trip(data, prefs)
    return _render("results.html", {
        "trip": trip,
        "reasoning": reasoning,
        "prefs": prefs,
        "form": form,
        "trip_number": 1,
    })


@post("/plan/second")
async def plan_second(request: Request) -> Template:
    form = dict(await request.form())
    prefs = _parse_form(form)
    _tag_prefs(prefs, trip_number=2)
    _crumb(
        "wizard", "second plan submit",
        trip_type=prefs.trip_type, priority=prefs.priority,
        budget_bucket=_budget_bucket(prefs.budget),
    )
    data = get_data()

    with _span(
        "expert.plan",
        description="primary itinerary (for excludes)",
        trip_type=prefs.trip_type,
    ):
        first_trip, _ = plan_trip(data, prefs)
    exclude = {cp.city.id for cp in first_trip.city_plans}
    with _span(
        "expert.plan",
        description="second itinerary search",
        trip_type=prefs.trip_type, n_excluded=len(exclude),
    ):
        second_trip, reasoning = plan_trip(data, prefs, exclude_cities=exclude)

    return _render("results.html", {
        "trip": second_trip,
        "reasoning": reasoning,
        "prefs": prefs,
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
    middleware=[_SessionIdMiddleware],
    template_config=TemplateConfig(
        directory=BASE / "templates",
        engine=JinjaTemplateEngine,
    ),
)
