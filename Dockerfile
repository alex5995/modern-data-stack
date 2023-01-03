FROM python:3.10.9
RUN pip install dbt-clickhouse==1.3.2

COPY ./dbt_project /dbt
COPY ./octavia_project /octavia

WORKDIR /dbt
