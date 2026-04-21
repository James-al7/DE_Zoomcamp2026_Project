FROM kestra/kestra:latest

USER root

RUN apt-get update -y \
    && apt-get install -y git python3 python3-pip python3-venv build-essential libpq-dev \
    && python3 -m pip install --no-cache-dir dbt-core dbt-postgres psycopg2-binary \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*