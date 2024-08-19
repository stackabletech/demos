from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, StringType, LongType, ShortType, FloatType, DoubleType, BooleanType, TimestampType, MapType, ArrayType
from pyspark.sql.functions import col, from_json, expr

import time

# Custom import to test loading dependencies
import banner

print(banner.bannertext)

spark = SparkSession.builder.appName("spark-report").getOrCreate()

spark.sql("show catalogs").show()
spark.sql("show tables in lakehouse.default").show()

customer_table = "lakehouse.customer_analytics.customer"
while not spark.catalog.tableExists(customer_table):
    print(f"Table {customer_table} not found, waiting for Trino to create it...")
    time.sleep(5)

print(f"Table {customer_table} found, starting report")

spark.sql(f"SELECT * FROM lakehouse.customer_analytics.customer").show()

print("Job done")
