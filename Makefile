DOCKER_NETWORK = bigdata-docker_default
ENV_FILE = data/hadoop/hadoop.env
CONTAINER_NAME=superset
USERNAME=admin
FIRSTNAME=Superset
LASTNAME=Admin
EMAIL=admin@superset.com
PASSWORD=admin
# current_branch := $(shell git rev-parse --abbrev-ref HEAD)
# build:
# 	docker build -t bde2020/hadoop-base:$(current_branch) ./base
# 	docker build -t bde2020/hadoop-namenode:$(current_branch) ./namenode
# 	docker build -t bde2020/hadoop-datanode:$(current_branch) ./datanode
# 	docker build -t bde2020/hadoop-resourcemanager:$(current_branch) ./resourcemanager
# 	docker build -t bde2020/hadoop-nodemanager:$(current_branch) ./nodemanager
# 	docker build -t bde2020/hadoop-historyserver:$(current_branch) ./historyserver
# 	docker build -t bde2020/hadoop-submit:$(current_branch) ./submit

# copy:
# 	# docker build -t hadoop-wordcount ./submit
# 	# docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -mkdir -p /input/
# 	# docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -copyFromLocal -f /opt/hadoop-3.2.1/README.txt /input/
# 	# docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
# 	# docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -cat /output/*
# 	# docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -rm -r /output
# 	# docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -rm -r /input

start:
	$ docker exec -it ${CONTAINER_NAME} superset fab create-admin \
						--username ${USERNAME} \
						--firstname ${FIRSTNAME} \
						--lastname ${LASTNAME} \
						--email ${EMAIL} \
						--password ${PASSWORD}
	$ docker exec -it superset superset db upgrade
	$ docker exec -it superset superset load_examples
	$ docker exec -it superset superset init