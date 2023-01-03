start:
	docker compose up -d

	git clone --branch v0.40.26 --depth 1 https://github.com/airbytehq/airbyte.git || true
	cd airbyte && docker compose up -d

	argo_project/start.sh

stop:
	docker compose down
	cd airbyte && docker compose down
	minikube stop

octavia-apply:
	docker compose exec octavia octavia apply --force

argo-apply:
	minikube image build -t mds-app .
	minikube kubectl -- apply -n argo -f argo_project/credentials.yml
	minikube kubectl -- apply -n argo -f argo_project/cron.yml

metabase-exposures:
	docker compose exec app dbt-metabase exposures --output_path models --output_name exposures

reset: stop
	docker volume rm airbyte_data
	docker volume rm airbyte_db
	docker volume rm airbyte_workspace
	docker volume rm mds_customers_db
	docker volume rm mds_orders_db
	docker volume rm mds_metabase_db
	docker volume rm mds_clickhouse
	minikube delete --profile minikube

minikube-install:
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64
	sudo install minikube-darwin-amd64 /usr/local/bin/minikube
	rm minikube-darwin-amd64
