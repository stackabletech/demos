FROM docker.stackable.tech/stackable/spark-k8s:3.5.1-stackable24.7.0

COPY demos/jupyterhub-pyspark-hdfs-anomaly-detection-taxi-data/requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r ./requirements.txt
