start:
	docker compose up -d
	git clone --depth 1 https://github.com/airbytehq/airbyte.git || true
	cd airbyte && docker compose up -d

stop:
	docker compose down
	cd airbyte && docker compose down

octavia-apply:
	docker compose exec octavia bash -c 'octavia apply --force'

dbt:
	docker compose exec dbt bash -c 'dbt build'

reset: stop
	docker volume rm airbyte_data
	docker volume rm airbyte_db
	docker volume rm airbyte_workspace
	docker volume rm mds_customers_db
	docker volume rm mds_orders_db
	docker volume rm mds_metabase_db
	docker volume rm mds_clickhouse
