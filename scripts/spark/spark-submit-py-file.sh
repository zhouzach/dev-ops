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
--conf spark.dynamicAllocation.enabled=false \
--conf spark.shuffle.service.enabled=false \
--conf drop.sql.adaptive.enabled=true \
--conf drop.sql.adaptive.join.enabled=true \
--conf drop.sql.adaptive.skewedJoin.enabled=true \
--conf drop.sql.auto.repartition=true \
--conf spark.speculation=true \
--conf drop.sql.cbo.enabled=true \
--conf drop.sql.sources.partitionOverwriteMode=dynamic \
--keytab /home/keytab/user.keytab \
--principal user@example.cn \
job.py > linfer.log 2>&1 &




