# Inteligencia Artificial: Sistemas Basados en el Conocimiento (SBC)

## Descripción
Esta es la segunda práctica de la asignatura de Inteligencia Artificial (IA) enfocada en los **Sistemas Basados en el Conocimiento (SBC)**. El proyecto consiste en el modelado y desarrollo de un sistema experto utilizando el motor de reglas **CLIPS**, apoyado por una ontología diseñada en **Protégé**.

---

## Autores
* Sara Buceta
* Pol Casacuberta
* Alejandro Espinosa

---

## Estructura del Proyecto

```text
SBC_IA/
├── src/                 # Código fuente del sistema experto y ontología
│   ├── main.clp         # Archivo principal de ejecución
│   ├── sbc.clp          # Reglas y base de conocimiento del sistema
│   ├── instancias.clp   # Instancias y hechos iniciales
│   ├── transporte.clp   # Reglas específicas de un dominio (transporte)
│   └── sbc.owl          # Ontología de dominio creada con Protégé
├── docs/                # Documentación del proyecto
├── clips_doc/           # Documentación y de referencia sobre CLIPS
├── test/                # Casos de prueba e instancias de testeo
├── punto_extra/         # Implementaciones adicionales para nota extra
├── Makefile             # Utilidad para compilar y empaquetar la entrega final
└── README.md            # Este archivo
```

---

## Prerrequisitos e Instalación

Para poder editar el conocimiento y ejecutar el sistema experto, se requieren las siguientes herramientas:

1. **[CLIPS](http://www.clipsrules.net/)**: Motor de inferencia necesario para ejecutar los scripts `.clp`.
2. **[Protégé](https://protege.stanford.edu/)**: Entorno para crear, visualizar y editar la ontología `sbc.owl`.
3. **`owl2clips`**: Script en Python para transformar la ontología OWL a un formato directamente importable en CLIPS.

Para instalar el conversor `owl2clips` usando `pip`:

```shell
pip install owl2clips
```

---

## Uso y Ejecución

### 1. Conversión de la Ontología (Protégé a CLIPS)
Si se realizan cambios de clases o atributos en Protégé, guarda la ontología en formato **Turtle** y transpílala a hechos/clases de CLIPS usando el siguiente comando:

```shell
owl2clips --input src/sbc.owl --format turtle
```

### 2. Ejecutar el Sistema Experto
Abre el entorno iteractivo de CLIPS en tu terminal y carga los programas base. El flujo tradicional recomendado es:

```shell
CLIPS> (load "src/sbc.clp")
CLIPS> (load "src/instancias.clp")
CLIPS> (load "src/main.clp")
CLIPS> (reset)
CLIPS> (run)
```
*(Nota: dependiendo del entorno, si `main.clp` incluye sentencias internas de `load`, bastará con cargar el archivo principal de forma directa)*.

---

## Web App

An interactive web frontend that reimplements the CLIPS expert system in Python. Users answer 10 questions about their travel preferences through a step-by-step wizard and receive a complete itinerary with cities, hotels, activities, transport, and cost.

**Stack:** HTMX + Alpine.js (no JS build step) + FastAPI/Jinja2 backend

### Quick Start

```bash
# Docker (recommended)
docker compose up -d        # http://localhost:8088

# Dev mode
make web-dev                # uvicorn on :8088 with --reload
```

### Features

- 10-step questionnaire wizard with HTMX partial HTML swaps (no full page reloads)
- Alpine.js for client-side interactivity: dynamic age inputs, transport chip selectors, star rating picker
- Python reimplementation of all CLIPS inference and logic rules (city scoring, hotel/transport/activity selection, budget constraints)
- City-by-city timeline results with hotel, activities, and transport details
- Second trip planning (excludes first trip's cities)
- Zero JavaScript build step — HTMX and Alpine.js are vendored static files (~95KB total)

### Web Structure

```
web/
├── backend/
│   ├── data.py                # Parse instancias.clp → Python dataclasses
│   ├── solver.py              # Trip planning logic (inference + selection)
│   ├── app.py                 # FastAPI + Jinja2
│   ├── templates/
│   │   ├── base.html          # Dark theme shell + HTMX/Alpine script tags
│   │   ├── index.html         # Landing page
│   │   ├── steps/             # 10 wizard step partials
│   │   └── results.html       # Trip itinerary display
│   └── static/
│       ├── theme.css / app.css
│       ├── htmx.min.js        # Vendored
│       └── alpine.min.js      # Vendored
└── requirements.txt
```

---

## Empaquetado y Entrega

El proyecto incluye un archivo `Makefile` que automatiza la creación del archivo de subida unificando el código y la memoria del proyecto (`Practica_de_representacion_del_conocimiento.pdf`).

Para generar el archivo final `Sara_Buceta_Pol_Casacuberta_Alejandro_Espinosa.zip`:
```bash
make
```

Para limpiar el entorno y eliminar los archivos `.zip` generados:
```bash
make clean
```
