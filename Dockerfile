FROM mysql

COPY ./database/market_data.sql /docker-entrypoint-initdb.d/

RUN docker run --name mysqlbd1 -e MYSQL_ROOT_PASSWORD=@Eric406586 -p "3307:3306" -d mysql

FROM minio/minio
RUN docker run --name minio -d -p 9000:9000 -p 9001:9001 -v "$PWD/datalake:/data" minio/minio server /data --console-address ":9001"

FROM python
RUN docker run -d -p 8080:8080 -v "$PWD/airflow/dags:/opt/airflow/dags/" --entrypoint=/bin/bash --name airflow apache/airflow:2.1.1-python3.8 -c '(airflow db init && airflow users create --username admin --password @Eric406586 --firstname Eric --lastname Batista --role Admin --email klose.eric31@gmail.com); airflow webserver & airflow scheduler'