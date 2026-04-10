"""Trip planning expert system — Python reimplementation of CLIPS rules."""

from __future__ import annotations

from dataclasses import dataclass, field

from .data import WorldData, City, Accommodation, Activity, Transport


CITY_LISTS: dict[str, list[str]] = {
    "romantico": ["paris", "venecia", "barcelona", "nueva_york", "granada", "praga", "amsterdam", "kioto"],
    "descanso": ["tahiti", "cancun", "punta_cana", "las_vegas", "miami"],
    "diversion": ["paris", "venezia", "las_vegas", "barcelona", "roma"],
    "trabajo": ["barcelona", "nueva_york", "roma", "amsterdam", "paris"],
    "aventura": ["miami", "barcelona", "cancun", "las_vegas"],
    "cultural": ["paris", "roma", "barcelona", "granada", "kioto"],
}


@dataclass
class UserPrefs:
    ages: list[int]
    trip_type: str
    days_min: int
    days_max: int
    days_per_city_min: int
    days_per_city_max: int
    cities_min: int
    cities_max: int
    budget: float
    avoid_transport: list[str]
    min_stars: int
    prefer_unknown: bool
    priority: str  # duracion | calidad | mixto


@dataclass
class CityPlan:
    city: City
    days: int
    hotel: Accommodation | None = None
    activities: list[Activity] = field(default_factory=list)
    transport_to_next: Transport | None = None


@dataclass
class TripPlan:
    city_plans: list[CityPlan]
    total_days: int
    total_cost: float
    valid: bool
    errors: list[str] = field(default_factory=list)


@dataclass
class HotelCandidate:
    hotel: Accommodation
    fit: int
    total_price: float
    chosen: bool = False


@dataclass
class TransportCandidate:
    transport: Transport
    chosen: bool = False
    avoid_relaxed: bool = False


@dataclass
class ActivityDecision:
    activity: Activity
    chosen: bool = True
    skip_reason: str = ""


@dataclass
class CityDecision:
    city: City
    score: int
    status: str  # "chosen", "skipped", "not_reached"
    skip_reason: str = ""


@dataclass
class BudgetStep:
    label: str
    amount: float
    remaining: float


@dataclass
class CityReasoning:
    hotel_candidates: list[HotelCandidate] = field(default_factory=list)
    hotel_relaxed: bool = False
    transport_candidates: list[TransportCandidate] = field(default_factory=list)
    transport_avoid_relaxed: bool = False
    activity_decisions: list[ActivityDecision] = field(default_factory=list)
    duration_used: int = 0
    duration_max: int = 0


@dataclass
class PlanReasoning:
    inferred: dict = field(default_factory=dict)
    city_ranking: list[CityDecision] = field(default_factory=list)
    city_details: list[CityReasoning] = field(default_factory=list)
    budget_steps: list[BudgetStep] = field(default_factory=list)
    cost_hotels: float = 0.0
    cost_transport: float = 0.0
    cost_activities: float = 0.0
    excluded_cities: set = field(default_factory=set)


def _infer(prefs: UserPrefs) -> dict:
    """Inference phase: derive user_type, has_children, etc."""
    has_children = any(a <= 12 for a in prefs.ages)
    has_teens = any(12 <= a <= 20 for a in prefs.ages)
    n = len(prefs.ages)

    if n == 1:
        user_type = "individual"
    elif n == 2:
        user_type = "pareja"
    elif n < 10 and has_children:
        user_type = "familia"
    else:
        user_type = "grupo"

    same_continent = prefs.days_max < 6

    return {
        "has_children": has_children,
        "has_teens": has_teens,
        "user_type": user_type,
        "same_continent": same_continent,
    }


def _score_cities(data: WorldData, prefs: UserPrefs) -> list[tuple[City, int]]:
    """Score all cities based on trip type (matching CLIPS INFERENCIA rules)."""
    preferred = CITY_LISTS.get(prefs.trip_type, [])
    scored: list[tuple[City, int]] = []
    for city in data.cities_list():
        if city.name.lower() in preferred:
            scored.append((city, 50))
        else:
            scored.append((city, 10))
    scored.sort(key=lambda x: -x[1])
    return scored


def _pick_cities(
    scored: list[tuple[City, int]],
    prefs: UserPrefs,
    same_continent: bool,
    exclude: set[str] | None = None,
    city_ranking_out: list[CityDecision] | None = None,
) -> list[CityPlan]:
    """Greedy city selection matching CLIPS LOGIC rules."""
    exclude = exclude or set()
    plans: list[CityPlan] = []
    total_days = 0
    chosen_continent: str | None = None
    capped = False

    for city, fitness in scored:
        if city.id in exclude:
            if city_ranking_out is not None:
                city_ranking_out.append(CityDecision(city, fitness, "skipped", "excluded (first trip)"))
            continue
        if capped:
            if city_ranking_out is not None:
                city_ranking_out.append(CityDecision(city, fitness, "not_reached"))
            continue
        if len(plans) >= prefs.cities_max:
            capped = True
            if city_ranking_out is not None:
                city_ranking_out.append(CityDecision(city, fitness, "not_reached", "city limit reached"))
            continue

        days = min(prefs.days_per_city_max, prefs.days_max - total_days)
        if days < prefs.days_per_city_min:
            if city_ranking_out is not None:
                city_ranking_out.append(CityDecision(city, fitness, "skipped", "not enough days left"))
            continue

        if same_continent:
            if chosen_continent is None:
                chosen_continent = city.continent
            elif city.continent != chosen_continent:
                if city_ranking_out is not None:
                    city_ranking_out.append(CityDecision(city, fitness, "skipped", f"continent mismatch ({city.continent} ≠ {chosen_continent})"))
                continue

        plans.append(CityPlan(city=city, days=days))
        if city_ranking_out is not None:
            city_ranking_out.append(CityDecision(city, fitness, "chosen"))
        total_days += days

        if total_days >= prefs.days_max:
            capped = True

    return plans


def _pick_hotel(
    data: WorldData, city_plan: CityPlan, prefs: UserPrefs, remaining_budget: float,
    reasoning_out: CityReasoning | None = None,
) -> Accommodation | None:
    """Pick best hotel for a city (matching CLIPS LOGIC::escoger-alojamiento)."""
    candidates = data.accommodations_in(city_plan.city.id)
    scored: list[tuple[Accommodation, int]] = []
    relaxed = False

    for acc in candidates:
        total_cost = acc.price_per_night * city_plan.days
        if total_cost > remaining_budget:
            continue
        if acc.stars < prefs.min_stars:
            continue

        fit = 0
        if acc.distance_to_center < 5:
            fit += 10
        if acc.stars >= prefs.min_stars:
            fit += 90
        scored.append((acc, fit))

    if not scored:
        relaxed = True
        for acc in candidates:
            total_cost = acc.price_per_night * city_plan.days
            if total_cost > remaining_budget:
                continue
            scored.append((acc, 0))

    scored.sort(key=lambda x: (-x[1], x[0].price_per_night))

    if reasoning_out is not None:
        reasoning_out.hotel_relaxed = relaxed
        winner = scored[0][0] if scored else None
        for acc, fit in scored[:5]:
            reasoning_out.hotel_candidates.append(
                HotelCandidate(acc, fit, acc.price_per_night * city_plan.days, chosen=(acc is winner))
            )

    return scored[0][0] if scored else None


def _pick_transport(
    data: WorldData,
    from_city: City,
    to_city: City,
    prefs: UserPrefs,
    remaining_budget: float,
    reasoning_out: CityReasoning | None = None,
) -> Transport | None:
    """Pick transport between two cities (matching CLIPS LOGIC::escoger-transporte)."""
    candidates = data.transports_between(from_city.id, to_city.id)
    avoid_lower = [m.lower() for m in prefs.avoid_transport]
    valid = [
        t for t in candidates
        if t.mode.lower() not in avoid_lower
        and t.price <= remaining_budget
    ]
    avoid_relaxed = False
    if not valid:
        avoid_relaxed = True
        valid = [t for t in candidates if t.price <= remaining_budget]
    valid.sort(key=lambda t: t.price)

    winner = valid[0] if valid else None
    if reasoning_out is not None:
        reasoning_out.transport_avoid_relaxed = avoid_relaxed
        for t in valid:
            reasoning_out.transport_candidates.append(
                TransportCandidate(t, chosen=(t is winner), avoid_relaxed=avoid_relaxed)
            )

    return winner


def _pack_activities(
    data: WorldData, city_plan: CityPlan, remaining_budget: float,
    reasoning_out: CityReasoning | None = None,
) -> list[Activity]:
    """Greedily pack activities (matching CLIPS LOGIC::escoger-actividades)."""
    candidates = data.activities_in(city_plan.city.id)
    max_duration = city_plan.days * 100
    used_duration = 0
    chosen: list[Activity] = []
    cost = 0.0

    for act in candidates:
        if used_duration + act.duration_pct > max_duration:
            if reasoning_out is not None:
                reasoning_out.activity_decisions.append(
                    ActivityDecision(act, False, "over duration capacity")
                )
            continue
        if cost + act.price > remaining_budget:
            if reasoning_out is not None:
                reasoning_out.activity_decisions.append(
                    ActivityDecision(act, False, "over budget")
                )
            continue
        chosen.append(act)
        used_duration += act.duration_pct
        cost += act.price
        if reasoning_out is not None:
            reasoning_out.activity_decisions.append(ActivityDecision(act, True))

    if reasoning_out is not None:
        reasoning_out.duration_used = used_duration
        reasoning_out.duration_max = max_duration

    return chosen


def plan_trip(
    data: WorldData,
    prefs: UserPrefs,
    exclude_cities: set[str] | None = None,
) -> tuple[TripPlan, PlanReasoning]:
    """Full trip planning pipeline. Returns (plan, reasoning)."""
    info = _infer(prefs)
    scored = _score_cities(data, prefs)

    reasoning = PlanReasoning(
        inferred=info,
        excluded_cities=exclude_cities or set(),
    )

    city_plans = _pick_cities(
        scored, prefs, info["same_continent"], exclude_cities,
        city_ranking_out=reasoning.city_ranking,
    )

    errors: list[str] = []
    budget_left = prefs.budget
    total_cost = 0.0

    reasoning.budget_steps.append(BudgetStep("Starting budget", 0, budget_left))

    city_reasonings: list[CityReasoning] = []

    for cp in city_plans:
        cr = CityReasoning()
        hotel = _pick_hotel(data, cp, prefs, budget_left, reasoning_out=cr)
        if hotel:
            cp.hotel = hotel
            hotel_cost = hotel.price_per_night * cp.days
            budget_left -= hotel_cost
            total_cost += hotel_cost
            reasoning.cost_hotels += hotel_cost
            reasoning.budget_steps.append(
                BudgetStep(f"Hotel in {cp.city.name}", hotel_cost, budget_left)
            )
        city_reasonings.append(cr)

    for i in range(len(city_plans) - 1):
        cr = city_reasonings[i]
        t = _pick_transport(
            data, city_plans[i].city, city_plans[i + 1].city, prefs, budget_left,
            reasoning_out=cr,
        )
        if t:
            city_plans[i].transport_to_next = t
            budget_left -= t.price
            total_cost += t.price
            reasoning.cost_transport += t.price
            reasoning.budget_steps.append(
                BudgetStep(
                    f"Transport {city_plans[i].city.name} → {city_plans[i + 1].city.name}",
                    t.price, budget_left,
                )
            )
        else:
            errors.append(
                f"No transport found: {city_plans[i].city.name} → {city_plans[i + 1].city.name}"
            )

    for idx, cp in enumerate(city_plans):
        cr = city_reasonings[idx]
        acts = _pack_activities(data, cp, budget_left, reasoning_out=cr)
        cp.activities = acts
        act_cost = sum(a.price for a in acts)
        budget_left -= act_cost
        total_cost += act_cost
        reasoning.cost_activities += act_cost
        if act_cost > 0:
            reasoning.budget_steps.append(
                BudgetStep(f"Activities in {cp.city.name}", act_cost, budget_left)
            )

    reasoning.city_details = city_reasonings

    total_days = sum(cp.days for cp in city_plans)
    if total_days < prefs.days_min:
        errors.append(f"Trip too short: {total_days} days (minimum {prefs.days_min})")
    if len(city_plans) < prefs.cities_min:
        errors.append(f"Too few cities: {len(city_plans)} (minimum {prefs.cities_min})")
    if any(cp.hotel is None for cp in city_plans):
        errors.append("Could not find accommodation for all cities")

    trip = TripPlan(
        city_plans=city_plans,
        total_days=total_days,
        total_cost=total_cost,
        valid=len(errors) == 0,
        errors=errors,
    )
    return trip, reasoning
