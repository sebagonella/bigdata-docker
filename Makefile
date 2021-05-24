# Superset
SUPERSET_CONTAINER_NAME=superset
USERNAME=admin
FIRSTNAME=Superset
LASTNAME=Admin
EMAIL=admin@superset.com
PASSWORD=admin

# Grafana
GRAFANA_CONTAINER_NAME=grafana

start:
	# Superset
	docker exec -it ${SUPERSET_CONTAINER_NAME} superset fab create-admin \
						--username ${USERNAME} \
						--firstname ${FIRSTNAME} \
						--lastname ${LASTNAME} \
						--email ${EMAIL} \
						--password ${PASSWORD}
	docker exec -it superset superset db upgrade
	docker exec -it superset superset load_examples
	docker exec -it superset superset init

	# Grafana
	docker exec -it ${GRAFANA_CONTAINER_NAME} grafana-cli --pluginUrl https://github.com/grafadruid/druid-grafana/releases/download/v1.1.0/grafadruid-druid-datasource-1.1.0.zip plugins install grafadruid-druid-datasource
	docker stop ${GRAFANA_CONTAINER_NAME}
	docker start ${GRAFANA_CONTAINER_NAME}