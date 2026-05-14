FROM python:3.12-slim

WORKDIR /app

RUN pip install poetry

COPY pyproject.toml .
COPY src/ src/

RUN poetry config virtualenvs.create false
RUN poetry install --no-root

ENV PYTHONPATH=/app/src

CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8097"]
