#!/usr/bin/env bash


/usr/local/spark-2.2.0-bin-2.6.0-cdh5.8.0/bin/spark-sql \
--master yarn \
--deploy-mode client \
--conf "spark.executor.extraJavaOptions=-XX:+UseG1GC" \
--driver-cores 2 \
--conf spark.driver.memory=10G \
--executor-cores 2 \
--executor-memory 10G \
--num-executors 3 \
--conf spark.default.parallelism=120 \
--conf spark.storage.memoryFraction=0.5 \
--conf spark.shuffle.memoryFraction=0.3 \
--conf spark.sql.shuffle.partitions=600 \
--conf spark.network.timeout=600 \
 --conf drop.sql.crossJoin.enabled=true




