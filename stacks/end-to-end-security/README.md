`stackablectl -s stacks/stacks-v2.yaml -r stacks/end-to-end-security/release.yaml stack in end-to-end-security`

`java -jar ~/Downloads/trino-cli-435-executable.jar --server https://172.18.0.2:32616 --insecure --user admin --external-authentication`

`create table lakehouse.default.customer as select * from tpch.sf1.customer;`
