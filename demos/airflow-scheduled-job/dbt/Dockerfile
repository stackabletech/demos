FROM python:3.12-slim-bullseye AS builder

# Install build dependencies
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Create virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Install Python packages
COPY demos/airflow-scheduled-job/dbt/requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Final stage
FROM python:3.12-slim-bullseye

RUN apt-get update && apt-get install -y \
    git \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Copy virtual environment from builder
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /dbt

COPY demos/airflow-scheduled-job/dbt/dbt_test ./dbt_test

# Security: non-root user
RUN useradd -m -u 1000 dbt && chown -R dbt:dbt /dbt
USER dbt

ENV DBT_PROFILES_DIR=/dbt

CMD ["dbt", "run"]
