#!/usr/bin/env bash


spark-shell --mode yarn-client

spark-shell --master yarn \
  --deploy-mode client \
  --num-executors 17 \
  --executor-cores 4 \
  --executor-memory 8g \
  --conf spark.executor.memoryOverhead=4g \
  --conf spark.dynamicAllocation.enabled=false \
  --conf spark.shuffle.service.enabled=false \
  --conf spark.sql.adaptive.enabled=true \
  --conf spark.sql.adaptive.join.enabled=true \
  --conf spark.sql.adaptive.skewedJoin.enabled=true \
  --conf spark.sql.auto.repartition=true \
  --conf spark.speculation=true \
  --conf spark.sql.cbo.enabled=true \
  --conf spark.sql.sources.partitionOverwriteMode=dynamic \
  --conf spark.sql.catalogImplementation=hive \
  --keytab /data/keytab/user.keytab \
  --principal user@mail.cn


#Spark-shell引入第三方包
spark-shell --jars path/nscala-time_2.10-2.12.0.jar

#若有多个jar包需要导入，中间用逗号隔开即可。

#scala shell引入
scala -classpath ~/Downloads/json4s-native_2.11-3.2.11.jar