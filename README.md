
# BIG DATA ECOSYSTEM COM DOCKER

Ambiente para estudo dos principais frameworks big data em docker.
<br> Esse setup vai criar dockers com os frameworks HDFS, HBase, Hive, Presto, Spark, Jupyter, Hue, Mongodb, Metabase, Nifi, kafka, Mysql e Zookeeper.
<br>

## SOFTWARES NECESSÁRIOS
#### Para a criação e uso do ambiente vamos utilizar git e docker
   * Instalação do Docker no [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
   *  [Instalação do git](https://git-scm.com/book/pt-br/v2/Come%C3%A7ando-Instalando-o-Git)

#### Em um terminal/DOS, dentro diretório docker, realizar o clone do projeto no github
         https://github.com/sebagonella/bigdata-docker.git

## INICIANDO O AMBIENTE

### No terminal, no diretorio bigdata_docker, executar o docker-compose
         $ docker-compose up -d        

### Verificar imagens e containers
         $ docker image ls
         $ docker container ls

## CONFIGURANDO O AMBIENTE

Após os containers estiverem rodando, execute os *comandos* mais abaixo para criar a conta admin ou execute o *make* para fazê-lo automaticamente. Se for executar o make, atualize as variáveis de ambiente no arquivo Makefile.

       $ make

### Superset

      $ docker exec -it superset superset fab create-admin \
                     --username admin \
                     --firstname Superset \
                     --lastname Admin \
                     --email admin@superset.com \
                     --password admin

Comando para migrar o DB para última versão:

      $ docker exec -it superset superset db upgrade

Carregue exemplos de gráficos:

      $ docker exec -it superset superset load_examples

Configure as roles:

      $ docker exec -it superset superset init

Superset pronto.


### Grafana

Após o grafana estar funcionando, é necessário a configuração do plugin para conexão com o Druid.

Entrar no container:

       $ docker exec -it grafana bash

Instalar o plugin:

       $ grafana-cli --pluginUrl https://github.com/grafadruid/druid-grafana/releases/download/v1.1.0/grafadruid-druid-datasource-1.1.0.zip plugins install grafadruid-druid-datasource

**grafadruid/druid-grafana**
https://github.com/grafadruid/druid-grafana

## AÇÕES ÚTEIS NOS CONTAINERS DOCKER

### Parar um containers
         docker stop [nome do container]      

### Parar todos containers
         docker stop $(docker ps -a -q)
  
### Remover um container
         docker rm [nome do container]

### Remover todos containers
         docker rm $(docker ps -a -q)         

### Dados do containers
         docker container inspect [nome do container]

### Iniciar um container
         docker-compose up -d [nome do container]

### Iniciar todos os containers
         docker-compose up -d 

### Acessar log do container
         docker container logs [nome do container] 

## Acesso WebUI dos Frameworks
 
* HDFS -http://localhost:9870
* Presto http://localhost:8080
* Hbase - http://localhost:16010/master-status
* Druid - http://localhost:8888/
* Mongo Express - http://localhost:8084
* Kafka Manager - http://localhost:9001
* Nifi - http://localhost:9090
* Jupyter - http://localhost:8889
* Spark - http://localhost:4040
* Hue - http://localhost:8890
* Metabase - http://localhost:3000
* Superset - http://localhost:8088
* Grafana - http://localhost:3001

## Acesso por shell

   ##### HDFS
          docker exec -it datanode bash

   ##### HBase
          docker exec -it hbase-master bash

   ##### Sqoop
          docker exec -it datanode bash
        
   ##### Kafka
          docker exec -it kafka bash

## Acesso JDBC

   ##### MySQL
          jdbc:mysql://database/employees

   ##### Hive
          jdbc:hive2://hive-server:10000/default

   ##### Presto
          jdbc:presto://presto:8080/hive/default

   ##### Druid
         jdbc:avatica:remote:url=http://druid-router:8082/druid/v2/sql/avatica/

## Usuários e senhas

   ##### Hue
    Usuário: admin
    Senha: admin

   ##### Metabase
    Usuário: bigdata@class.com
    Senha: bigdata123 

   ##### MySQL
    Usuário: root
    Senha: secret
   
   ##### MongoDB
    Usuário: root
    Senha: root
    Authentication Database: admin

## Imagens   

[Docker Hub](https://hub.docker.com/u/sebagonella)

## Versões dos componentes

* Hadoop - 3.2.1
* Sqoop - Não disponível ainda
* Oozie - Não disponível ainda
* Hive - 2.3.2
* Presto - 0.252
* Hbase - 1.2.6
* Druid -  0.21.0
* MongoDB - 4.2.3
* Mongo Express - 0.54.0
* Kafka - 2.3.0
* Kafka Manager - 2.0.0.2
* Nifi - 1.11.3
* Jupyter Notebook - 6.3.0
* Spark - 3.1.1
* Hue - 4.9.0
* Metabase - 0.34.3
* Superset - 1.1.0
* Grafana - 7.5.7

## Documentação Oficial

* https://zookeeper.apache.org/
* https://kafka.apache.org/
* https://nifi.apache.org/
* https://prestodb.io/
* https://spark.apache.org/
* https://www.mongodb.com/
* https://jupyter.org/
* https://hbase.apache.org/
* https://sqoop.apache.org/
* https://hadoop.apache.org/
* https://hive.apache.org/
* https://gethue.com/
* https://github.com/yahoo/CMAK
* https://grafana.com/
* https://superset.apache.org/
* https://www.metabase.com/
* https://druid.apache.org/
* https://www.docker.com/
