from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .config("spark.dynamicAllocation.enabled", false) \
    .config("spark.shuffle.service.enabled", false) \
    .config("spark.sql.adaptive.enabled", "true") \
    .config("spark.sql.adaptive.join.enabled", "true") \
    .config("spark.sql.adaptive.skewedJoin.enabled", "true") \
    .config("spark.sql.auto.repartition", "true") \
    .config("spark.speculation", "true") \
    .config("spark.sql.sources.partitionOverwriteMode", "dynamic") \
    .config("spark.sql.cbo.enabled",true) \
    .enableHiveSupport() \
    .getOrCreate()

spark.sql(
    """
select * from db1.tb1
    """).createOrReplaceTempView("orders")