# MDS Open Source Edition

This project aims to provide an example of a modern data stack made of open source tools.
The selected tools are both suitable for playing locally and for easily scaling when needed.

## Prerequisites

You just need [Docker](https://www.docker.com/) before starting.

## Setup

To completely setup the project you just have to run the following commands:

1. `make minikube-install` (not needed if you already have minikube installed)
2. `make start` (it starts all the services)
3. `make octavia-apply` (it applies the airbyte configurations)
4. `make argo-apply` (it applies the argo workflows configurations)
5. `minikube kubectl -- -n argo port-forward deployment/argo-server 2746:2746` (it provides you the interface of argo workflows)

## Clean up

If you just want to stop all the services, run `make stop`.

If you want to also clean the environment, run `make reset`.

## Services

The available services are:

- [airbyte](https://docs.airbyte.com)
    - interface [here](http://localhost:8000)
    - username: `airbyte`
    - password: `password`

- [clickhouse](https://clickhouse.com/docs)
    - interface [here](http://localhost:8123)
    - username: `airbyte`
    - password: `password`

- [metabase](https://www.metabase.com/docs)
    - interface [here](http://localhost:3000)
    - username: `example@example.com`
    - password: `mds123`

- [argo workflows](https://argoproj.github.io/argo-workflows)
    - interface [here](https://localhost:2746)
    - no credentials needed

- [octavia](https://github.com/airbytehq/airbyte/blob/master/octavia-cli/README.md)
    - run `docker compose exec octavia bash` for using the octavia CLI

- [dbt](https://docs.getdbt.com/)
    - run `docker compose exec app bash` for using the dbt CLI

## Data
The raw data are taken from the [jaffle shop](https://github.com/dbt-labs/jaffle_shop) example.
The original .csv files have been split and loaded in two different postgres databases.
The proposed split in two databases and the dbt models are just for exercise purposes and they make no sense in the real world.
