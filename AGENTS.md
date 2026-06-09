# SBC_IA

Frozen FIB-UPC AI coursework (Sistemas Basados en el Conocimiento): a CLIPS rule-based expert system for hotel/trip recommendation, backed by a Protégé OWL ontology. A later Python web app (`web/`) reimplements the same inference for an interactive HTMX/Alpine wizard.

## Architecture
- `src/sbc.clp` — rules and knowledge base; `src/instancias.clp` — facts/instances; `src/transporte.clp` — transport sub-domain; `src/main.clp` — entry point.
- `src/sbc.owl` — Protégé ontology (Turtle), converted to CLIPS via `owl2clips`.
- `web/` — Litestar + Jinja2 + HTMX/Alpine reimplementation (`backend/solver.py` mirrors the CLIPS logic); `docs/`, `clips_doc/`, `test/`, `punto_extra/` for memoria, reference, cases, and extras.

## Build and Test
- Expert system: open CLIPS, then `(load "src/sbc.clp")`, `(load "src/instancias.clp")`, `(load "src/main.clp")`, `(reset)`, `(run)`.
- Ontology edits: save as Turtle in Protégé and run `owl2clips --input src/sbc.owl --format turtle`.
- Web app: `docker compose up -d` (http://localhost:8088) or `make web-dev`. `make` repackages the submission zip.

## Pitfalls
- Coursework is frozen — do not refactor `.clp` files or rename authors/deliverables; the `Makefile` and zip name are part of the submission.
- Requires an external CLIPS runtime (not bundled); Protégé version affects `.owl` round-tripping.
- Keep `web/backend/solver.py` and `web/backend/data.py` in sync with `src/*.clp` if rules or instances change.

See [README.md](README.md).
