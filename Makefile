start:
	docker compose up -d
	docker compose exec octavia bash -c '/wait-for-it.sh localhost:5432'
	docker compose exec octavia bash -c '/wait-for-it.sh localhost:5433'
	docker compose exec postgres_customers bash -c 'psql -U postgres postgres < /pg_dumps/customers.pgsql' || true
	docker compose exec postgres_orders bash -c 'psql -U postgres postgres < /pg_dumps/orders.pgsql' || true

	git clone --depth 1 https://github.com/airbytehq/airbyte.git || true
	cd airbyte && docker compose up -d

stop:
	docker compose down
	cd airbyte && docker compose down

octavia-apply:
	docker compose exec octavia bash -c 'octavia apply --force'

reset: stop
	docker volume rm airbyte_data
	docker volume rm airbyte_db
	docker volume rm airbyte_workspace
