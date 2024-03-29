#Commons operator
helm install commons-operator stackable-stable/commons-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/commons-operator

#Secret operator
helm install secret-operator stackable-stable/secret-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/secret-operator

#Listener operaotr
helm install listener-operator stackable-stable/listener-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/listener-operator

#Airflow operator
helm install airflow-operator stackable-stable/airflow-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/airflow-operator

#Druid operator
helm install druid-operator stackable-stable/druid-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/druid-operator

#HBase operator
helm install hbase-operator stackable-stable/hbase-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/hbase-operator

#HDFS operator
helm install hdfs-operator stackable-stable/hdfs-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/hdfs-operator

#Hive operator
helm install hive-operator stackable-stable/hive-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/hive-operator

#Kafka operator
helm install kafka-operator stackable-stable/kafka-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/kafka-operator

#Nifi operator
helm install nifi-operator stackable-stable/nifi-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/nifi-operator

#Opa operator
helm install opa-operator stackable-stable/opa-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/opa-operator

#Spark operator
helm install spark-k8s-operator stackable-stable/spark-k8s-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/spark-k8s-operator

#Superset operator
helm install superset-operator stackable-stable/superset-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/superset-operator

#Trino operator
helm install trino-operator stackable-stable/trino-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/trino-operator

#Zookeeper operator
helm install zookeeper-operator stackable-stable/zookeeper-operator --namespace stackable-operators --create-namespace --version=24.3.0 --set image.repository=docker.stackable.tech/stackable-experimental/zookeeper-operator

# Patch your products using
# repo: docker.stackable.tech/stackable-experimental
