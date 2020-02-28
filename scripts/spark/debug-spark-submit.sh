#!/usr/bin/env bash


#https://spark.apache.org/docs/latest/submitting-applications.html

/opt/cloudera/parcels/CDH-5.13.3-1.cdh5.13.3.p0.2/bin/spark-submit \
--class MyApp \
--name simple-app \
--master yarn \
--deploy-mode client \
--driver-memory 1g \
--executor-memory 8g \
--conf spark.dynamicAllocation.enabled=false \
--conf spark.shuffle.service.enabled=false \
--conf spark.sql.auto.repartition=true \
--conf spark.sql.cbo.enabled=true \
--conf spark.sql.sources.partitionOverwriteMode=dynamic \
--num-executors 1 --executor-cores 1 \
--conf "spark.executor.extraJavaOptions=-agentlib:jdwp=transport=dt_socket,server=n,address=local-computer-ip:5005,suspend=n" \
--driver-java-options -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005 \
--keytab /home/keytab/user.keytab \
--principal user@example.cn \
job.jar "task:timer dt:2019-08-19 type:infer" > linfer.log 2>&1 &




