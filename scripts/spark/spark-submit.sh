#!/usr/bin/env bash


#https://spark.apache.org/docs/latest/submitting-applications.html

/opt/cloudera/parcels/CDH-5.13.3-1.cdh5.13.3.p0.2/bin/spark-submit \
--class MyApp \
--name simple-app \
--master yarn \
--deploy-mode client \
--driver-memory 1g \
--num-executors 20 \
--executor-cores 4 \
--executor-memory 8g \
--conf spark.sql.adaptive.enabled=true \
--conf spark.sql.adaptive.join.enabled=true \
--conf spark.sql.adaptive.skewedJoin.enabled=true \
--conf spark.sql.adaptive.skewedPartitionRowCountThreshold=1000000 \
--conf spark.sql.adaptive.skewedPartitionSizeThreshold=32000000 \
--conf spark.sql.adaptive.shuffle.targetPostShuffleInputSize=32000000 \
--conf spark.default.parallelism=600 \
--conf spark.sql.auto.repartition=true \
--conf spark.sql.hive.caseSensitiveInferenceMode=INFER_ONLY \
--conf spark.lineage.enabled=false \
--conf spark.sql.sources.partitionOverwriteMode=dynamic \
--conf spark.executor.memoryOverhead=4096 \
--keytab /home/keytab/user.keytab \
--principal user@example.cn \
job.jar "task:timer dt:2019-08-19 type:infer" > linfer.log 2>&1 &




