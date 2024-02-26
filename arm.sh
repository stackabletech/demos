helm install commons-operator stackable-stable/commons-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/commons-operator

# Use upstream images, as they have arm64 support
helm install secret-operator stackable-stable/secret-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/secret-operator --set csiProvisioner.image.repository=k8s.gcr.io/sig-storage/csi-provisioner --set csiNodeDriverRegistrar.image.repository=k8s.gcr.io/sig-storage/csi-node-driver-registrar

helm install listener-operator stackable-stable/listener-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/listener-operator
helm install airflow-operator stackable-stable/airflow-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/airflow-operator
helm install druid-operator stackable-stable/druid-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/druid-operator
helm install hbase-operator stackable-stable/hbase-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/hbase-operator
helm install hdfs-operator stackable-stable/hdfs-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/hdfs-operator
helm install hive-operator stackable-stable/hive-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/hive-operator
helm install kafka-operator stackable-stable/kafka-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/kafka-operator
helm install nifi-operator stackable-stable/nifi-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/nifi-operator
helm install opa-operator stackable-stable/opa-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/opa-operator
helm install spark-k8s-operator stackable-stable/spark-k8s-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/spark-k8s-operator
helm install superset-operator stackable-stable/superset-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/superset-operator
helm install trino-operator stackable-stable/trino-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/trino-operator
helm install zookeeper-operator stackable-stable/zookeeper-operator --namespace stackable-operators --create-namespace --version=23.11.0 --set image.repository=docker.stackable.tech/stackable-experimental/zookeeper-operator

# Patch your products using
# repo: docker.stackable.tech/stackable-experimental
