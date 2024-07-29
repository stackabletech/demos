# docker build -t docker.stackable.tech/demos/pyspark-k8s-with-scikit-learn:3.4.0-stackable0.0.0-dev .

FROM docker.stackable.tech/stackable/pyspark-k8s:3.4.0-stackable23.7.0

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r ./requirements.txt
