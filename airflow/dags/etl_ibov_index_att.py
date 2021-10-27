from datetime import datetime
import pandas as pd
from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.operators.bash import BashOperator
from airflow.models import Variable
from minio import Minio

DEFAULT_ARGS = {
    'owner': 'Eric Batista',
    'depends_on_past': False,
    'start_date': datetime(2021, 1, 1),
}

dag = DAG(
    'etl_ibov_index',
    default_args=DEFAULT_ARGS,
    schedule_interval='@once'
)

data_lake_server = Variable.get('data_lake_server')
data_lake_login = Variable.get('data_lake_login')
data_lake_password = Variable.get('data_lake_password')

client = Minio(
    data_lake_server,
    access_key=data_lake_login,
    secret_key=data_lake_password,
    secure=False
)

def extract():

    obj = client.get_object(
        'landing',
        'index/IBOV_2018_2021.csv'
    )

    data = obj.read()

    _df = pd.read_csv(data)
    _df.to_parquet('/tmp/index/IBOV_2018_2021.parquet', index=False)


def transform():
    pass

def load():
    pass

extract_task = PythonOperator(
    task_id='extract_files_from_data_lake',
    provide_context=True,
    python_callable=extract,
    dag=dag
)

transform_task = PythonOperator(
    task_id='transform_files_from_data_lake',
    python_callable=transform,
)

load_task = PythonOperator(
    task_id='load_files_to_data_lake',
    python_callable=load,
)

clean_task = BashOperator(
    task_id='clean_files_on_staging',
    bash_command='rm -f /tmp/*.csv;rm -f /tmp/*.json;rm -f /tmp/*.parquet',
    dag=dag
)

extract_task >> transform_task >> load_task >> clean_task