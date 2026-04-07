"""Parse CLIPS instancias.clp into Python dataclasses."""

from __future__ import annotations

import re
from dataclasses import dataclass, field
from pathlib import Path


@dataclass
class City:
    id: str
    name: str
    continent: str
    population: int


@dataclass
class Accommodation:
    id: str
    name: str
    city_id: str
    kind: str  # Hotel, Resort, Casa_Rural, Camping, Albergue
    stars: int
    distance_to_center: float
    price_per_night: float


@dataclass
class Activity:
    id: str
    name: str
    city_id: str
    category: str  # Cultural, Relax, Gastronomica, Naturaleza, Aventura, etc.
    duration_pct: int
    price: float


@dataclass
class Transport:
    id: str
    name: str
    from_city_id: str  # va_a in CLIPS (matched as origin in the CLIPS rules)
    to_city_id: str  # parte_de in CLIPS (matched as destination in rules)
    mode: str  # Avion, Tren, Barco
    price: float
    duration: int


ACTIVITY_CLASSES = frozenset({
    "Cultural", "Relax", "Gastronomica", "Naturaleza", "Aventura",
    "Ocio_Nocturno", "Visita_monumento", "Visita_museo", "Excursion",
})

ACCOMMODATION_CLASSES = frozenset({
    "Hotel", "Resort", "Casa_Rural", "Camping", "Albergue",
})

TRANSPORT_CLASSES = frozenset({"Avion", "Tren", "Barco"})

_HEADER_RE = re.compile(r"\(\[(\w+)\]\s+of\s+(\w+)")
_SLOT_RE = re.compile(r"\((\w+)\s+(\"[^\"]*\"|\[\w+\]|[\d.]+)\s*\)")


def _parse_value(raw: str) -> str | float | int:
    if raw.startswith('"') and raw.endswith('"'):
        return raw[1:-1]
    if raw.startswith("[") and raw.endswith("]"):
        return raw[1:-1]
    if "." in raw:
        return float(raw)
    return int(raw)


def _parse_instances_raw(text: str):
    """Yield (instance_id, class_name, slots_dict) for each instance."""
    current_id: str | None = None
    current_cls: str | None = None
    current_body: list[str] = []
    depth = 0

    for line in text.splitlines():
        hm = _HEADER_RE.search(line)
        if hm and depth == 0:
            current_id = hm.group(1)
            current_cls = hm.group(2)
            current_body = [line]
            depth = 1
            continue

        if current_id is not None:
            current_body.append(line)
            depth += line.count("(") - line.count(")")
            if depth <= 0:
                body_text = "\n".join(current_body)
                slots: dict = {}
                for sm in _SLOT_RE.finditer(body_text):
                    slots[sm.group(1)] = _parse_value(sm.group(2))
                yield current_id, current_cls, slots
                current_id = None
                current_cls = None
                current_body = []
                depth = 0


@dataclass
class WorldData:
    cities: dict[str, City] = field(default_factory=dict)
    accommodations: list[Accommodation] = field(default_factory=list)
    activities: list[Activity] = field(default_factory=list)
    transports: list[Transport] = field(default_factory=list)

    def cities_list(self) -> list[City]:
        return list(self.cities.values())

    def accommodations_in(self, city_id: str) -> list[Accommodation]:
        return [a for a in self.accommodations if a.city_id == city_id]

    def activities_in(self, city_id: str) -> list[Activity]:
        return [a for a in self.activities if a.city_id == city_id]

    def transports_between(self, from_id: str, to_id: str) -> list[Transport]:
        return [
            t for t in self.transports
            if t.from_city_id == from_id and t.to_city_id == to_id
        ]


def parse_instances(path: Path) -> WorldData:
    text = path.read_text(encoding="utf-8", errors="replace")
    data = WorldData()
    seen_cities: set[str] = set()

    for inst_id, cls_name, slots in _parse_instances_raw(text):
        if cls_name == "Ciudad":
            if inst_id in seen_cities:
                continue
            seen_cities.add(inst_id)
            data.cities[inst_id] = City(
                id=inst_id,
                name=str(slots.get("Nombre", inst_id)),
                continent=str(slots.get("Continente", "")),
                population=int(slots.get("Numero_de_habitantes", 0)),
            )
        elif cls_name in ACCOMMODATION_CLASSES:
            data.accommodations.append(Accommodation(
                id=inst_id,
                name=str(slots.get("Nombre", inst_id)),
                city_id=str(slots.get("esta_en", "")),
                kind=cls_name,
                stars=int(slots.get("Estrellas", 0)),
                distance_to_center=float(slots.get("Distancia_a_centro", 99)),
                price_per_night=float(slots.get("precio", 0)),
            ))
        elif cls_name in ACTIVITY_CLASSES:
            data.activities.append(Activity(
                id=inst_id,
                name=str(slots.get("Nombre", inst_id)),
                city_id=str(slots.get("se_hacen_en", "")),
                category=cls_name,
                duration_pct=int(slots.get("Duracion_actividad", 0)),
                price=float(slots.get("precio", 0)),
            ))
        elif cls_name in TRANSPORT_CLASSES:
            data.transports.append(Transport(
                id=inst_id,
                name=str(slots.get("Nombre", inst_id)),
                from_city_id=str(slots.get("va_a", "")),
                to_city_id=str(slots.get("parte_de", "")),
                mode=cls_name,
                price=float(slots.get("precio", 0)),
                duration=int(slots.get("duracion_transporte", 0)),
            ))

    return data


_DATA: WorldData | None = None


def get_data() -> WorldData:
    global _DATA
    if _DATA is None:
        for candidate in [
            Path("/app/data/instancias.clp"),
            Path(__file__).resolve().parent.parent.parent / "src" / "instancias.clp",
        ]:
            if candidate.exists():
                _DATA = parse_instances(candidate)
                break
        else:
            raise FileNotFoundError("instancias.clp not found")
    return _DATA
