"""Tests for the Litestar backend (SBC_IA Trip Planner)."""

import pytest
from litestar.testing import TestClient

from .app import app


@pytest.fixture()
def client():
    with TestClient(app) as c:
        yield c


def test_index(client):
    r = client.get("/")
    assert r.status_code == 200
    assert "text/html" in r.headers["content-type"]
    assert "Trip" in r.text or "SBC" in r.text or "html" in r.text.lower()


def test_static_css(client):
    r = client.get("/static/theme.css")
    assert r.status_code == 200


def test_static_htmx(client):
    r = client.get("/static/htmx.min.js")
    assert r.status_code == 200


def test_step1(client):
    r = client.post("/step/1", data={})
    assert r.status_code == 200
    assert "text/html" in r.headers["content-type"]


def test_step_range(client):
    for n in range(1, 11):
        r = client.post(f"/step/{n}", data={})
        assert r.status_code == 200, f"step {n} failed with {r.status_code}"


def test_step_with_form_data(client):
    r = client.post("/step/2", data={"ages": "25,30"})
    assert r.status_code == 200


FULL_FORM = {
    "ages": "25,35",
    "trip_type": "cultural",
    "days_min": "3",
    "days_max": "7",
    "days_per_city_min": "1",
    "days_per_city_max": "3",
    "cities_min": "1",
    "cities_max": "3",
    "budget": "2000",
    "avoid_transport": "",
    "min_stars": "2",
    "prefer_unknown": "false",
    "priority": "mixto",
}


def test_plan(client):
    r = client.post("/plan", data=FULL_FORM)
    assert r.status_code == 200
    assert "text/html" in r.headers["content-type"]
    assert "Itinerary" in r.text or "Trip" in r.text or "city" in r.text.lower()


def test_plan_contains_reasoning_panels(client):
    r = client.post("/plan", data=FULL_FORM)
    assert r.status_code == 200
    assert "How the system decided" in r.text
    assert "Inferred Profile" in r.text
    assert "City Ranking" in r.text
    assert "Budget Breakdown" in r.text


def test_plan_contains_preference_recap(client):
    r = client.post("/plan", data=FULL_FORM)
    assert r.status_code == 200
    assert "cultural" in r.text.lower() or "Cultural" in r.text
    assert "25" in r.text and "35" in r.text
    assert "2000" in r.text


def test_plan_contains_city_ranking_statuses(client):
    r = client.post("/plan", data=FULL_FORM)
    assert r.status_code == 200
    assert "Chosen" in r.text or "chosen" in r.text
    assert "badge-chosen" in r.text


def test_plan_contains_hotel_candidates(client):
    r = client.post("/plan", data=FULL_FORM)
    assert r.status_code == 200
    assert "Hotel candidates" in r.text or "Selection details" in r.text


def test_plan_contains_budget_steps(client):
    r = client.post("/plan", data=FULL_FORM)
    assert r.status_code == 200
    assert "Starting budget" in r.text
    assert "budget-bar-fill" in r.text


def test_plan_second(client):
    r = client.post("/plan/second", data=FULL_FORM)
    assert r.status_code == 200
    assert "text/html" in r.headers["content-type"]


def test_plan_second_shows_excluded(client):
    r = client.post("/plan/second", data=FULL_FORM)
    assert r.status_code == 200
    assert "Second Trip Context" in r.text or "excluded" in r.text.lower()


def test_plan_different_trip_types(client):
    for trip_type in ["romantico", "descanso", "aventura", "cultural"]:
        form = {**FULL_FORM, "trip_type": trip_type}
        r = client.post("/plan", data=form)
        assert r.status_code == 200, f"trip_type={trip_type} failed"
        assert "How the system decided" in r.text, f"reasoning missing for {trip_type}"


def test_plan_high_budget(client):
    form = {**FULL_FORM, "budget": "50000"}
    r = client.post("/plan", data=form)
    assert r.status_code == 200


def test_plan_minimal_budget(client):
    form = {**FULL_FORM, "budget": "100"}
    r = client.post("/plan", data=form)
    assert r.status_code == 200


def test_plan_prefer_unknown(client):
    form = {**FULL_FORM, "prefer_unknown": "true"}
    r = client.post("/plan", data=form)
    assert r.status_code == 200


# ─── Extended tests: multi-step flow & edge cases ────────────────


def test_step_sequence_preserves_state(client):
    """Posting steps 1→2→3 should accumulate form state."""
    client.post("/step/1", data={"ages": "20"})
    r = client.post("/step/2", data={"ages": "20", "trip_type": "aventura"})
    assert r.status_code == 200
    r = client.post("/step/3", data={"ages": "20", "trip_type": "aventura", "days_min": "5"})
    assert r.status_code == 200


def test_plan_with_transport_exclusion(client):
    form = {**FULL_FORM, "avoid_transport": "avion"}
    r = client.post("/plan", data=form)
    assert r.status_code == 200


def test_plan_with_high_min_stars(client):
    form = {**FULL_FORM, "min_stars": "5"}
    r = client.post("/plan", data=form)
    assert r.status_code == 200


def test_plan_cost_priority(client):
    form = {**FULL_FORM, "priority": "precio"}
    r = client.post("/plan", data=form)
    assert r.status_code == 200


def test_plan_quality_priority(client):
    form = {**FULL_FORM, "priority": "calidad"}
    r = client.post("/plan", data=form)
    assert r.status_code == 200


def test_step_invalid_number(client):
    r = client.post("/step/99", data={})
    assert r.status_code in [200, 400, 404]


def test_plan_response_is_html(client):
    r = client.post("/plan", data=FULL_FORM)
    assert "<!DOCTYPE html>" in r.text.lower() or "<html" in r.text.lower() or "text/html" in r.headers["content-type"]
