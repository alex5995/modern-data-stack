FROM python:3.10.9
RUN pip install \
    dbt-clickhouse==1.3.2 \
    dbt-metabase==0.9.14

COPY ./dbt_project /dbt
COPY ./octavia_project /octavia

RUN mkdir /root/.dbt-metabase
RUN cp /dbt/dbt_metabase_config.yml /root/.dbt-metabase/config.yml

WORKDIR /dbt
