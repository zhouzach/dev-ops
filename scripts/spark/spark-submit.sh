#!/usr/bin/env bash


#https://spark.apache.org/docs/latest/submitting-applications.html

/opt/cloudera/parcels/CDH-5.13.3-1.cdh5.13.3.p0.2/bin/spark-submit \
--class MyApp \
--master yarn \
--deploy-mode cluster \
--driver-memory 2g \
--num-executors  2 \
--executor-cores 1 \
--executor-memory 4g \
--keytab /home/keytab/user.keytab \
--principal user@example.cn \
job.jar




