FROM python:3.12-slim
WORKDIR /app

COPY web/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY src/instancias.clp ./data/instancias.clp
COPY web/backend/ ./backend/

EXPOSE 8088
CMD ["uvicorn", "backend.app:app", "--host", "0.0.0.0", "--port", "8088"]
