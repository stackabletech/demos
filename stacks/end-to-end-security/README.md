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
    CAST(c_customer_id AS VARCHAR) AS customer_id,
    c_current_cdemo_sk AS customer_demographics_sk,
    c_current_hdemo_sk AS household_demographics_sk,
    -- c_current_addr_sk AS address_sk,
    -- c_first_shipto_date_sk,
    -- c_first_sales_date_sk,
    CAST(c_salutation AS VARCHAR) AS salutation,
    CAST(c_first_name AS VARCHAR) AS given_name,
    CAST(c_last_name AS VARCHAR) AS family_name,
    COALESCE(c_preferred_cust_flag = 'Y', false) AS preferred_cust_flag,
    CAST(date_parse(CAST(c_birth_year AS varchar) || '-' || CAST(c_birth_month AS varchar) || '-' || CAST(c_birth_day AS varchar), '%Y-%m-%d') AS date) AS birth_date,
    CAST(c_birth_country AS VARCHAR) AS birth_country,
    -- CAST(c_login AS VARCHAR) AS c_login,
	CAST(c_email_address AS VARCHAR) AS email_address,
    --	c_last_review_date_sk
    ca_city AS city,
    ca_country AS country
FROM
    tpcds.sf10.customer AS c
LEFT JOIN tpcds.sf10.customer_address AS a ON
    c.c_current_addr_sk = a.ca_address_sk;

CREATE TABLE IF NOT EXISTS lakehouse.customer_analytics.customer_demographics AS
SELECT
	cd_demo_sk AS customer_demographics_sk,
	CAST(cd_gender AS VARCHAR) AS gender,
	CAST(cd_marital_status AS VARCHAR) AS marital_status,
	CAST(cd_education_status AS VARCHAR) AS education_status,
	cd_purchase_estimate AS purchase_estimate,
	CASt(cd_credit_rating AS VARCHAR) AS credit_rating,
	cd_dep_count AS dependent_count,
	cd_dep_employed_count AS dependent_employed_count,
	cd_dep_college_count AS dependent_college_count
FROM tpcds.sf10.customer_demographics;
```
