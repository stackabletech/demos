FROM docker.stackable.tech/stackable/spark-k8s:3.5.0-stackable24.3.0

COPY demos/jupyterhub-pyspark-hdfs-anomaly-detection-taxi-data/requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r ./requirements.txt
