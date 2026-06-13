FROM python:3.12-slim

WORKDIR /app

RUN pip install poetry

COPY pyproject.toml poetry.lock* ./
COPY src/ src/
COPY tests/ tests/

RUN poetry config virtualenvs.create false
RUN poetry install --no-root --extras test

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8097"]
