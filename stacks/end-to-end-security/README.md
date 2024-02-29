```sh
stackablectl -s stacks/stacks-v2.yaml -r stacks/end-to-end-security/release.yaml stack in end-to-end-security
stackablectl stacklet list
java -jar ~/Downloads/trino-cli-434-executable.jar --server https://172.18.0.2:32616 --insecure --user admin --external-authentication
```

```sql
CREATE SCHEMA IF NOT EXISTS lakehouse.compliance WITH (location = 'hdfs:/lakehouse/compliance/');
CREATE SCHEMA IF NOT EXISTS lakehouse.customer_analytics WITH (location = 'hdfs:/lakehouse/customer-analytics/');

CREATE TABLE IF NOT EXISTS lakehouse.customer_analytics.customers AS
SELECT
	c_customer_sk,
	cast(c_customer_id AS VARCHAR) AS c_customer_id,
	c_current_cdemo_sk,
	c_current_hdemo_sk,
	c_current_addr_sk,
	c_first_shipto_date_sk,
	c_first_sales_date_sk,
    cast(c_salutation AS VARCHAR) AS c_salutation,
    cast(c_first_name AS VARCHAR) AS c_first_name,
    cast(c_last_name AS VARCHAR) AS c_last_name,
	coalesce(c_preferred_cust_flag = 'Y', false) AS c_preferred_cust_flag,
	cast(date_parse(cast(c_birth_year as varchar) || '-' || cast(c_birth_month as varchar) || '-' || cast(c_birth_day as varchar), '%Y-%m-%d') as date) as c_birth_date,
    cast(c_birth_country AS VARCHAR) AS c_birth_country,
    cast(c_login AS VARCHAR) AS c_login,
	cast(c_email_address AS VARCHAR) AS c_email_address,
	c_last_review_date_sk
FROM tpcds.sf1.customer;
```
