
spark-submit \
--class org.rabbit.phoenix.PhoenixSparkHelper \
--name PhoenixSparkHelper \
--master yarn \
--deploy-mode client \
--driver-memory 1g \
--num-executors 8 \
--executor-cores 2 \
--executor-memory 7g \
--conf spark.eventLog.enabled=true \
--conf spark.sql.hive.caseSensitiveInferenceMode=INFER_ONLY \
--conf spark.lineage.enabled=false \
--conf spark.sql.sources.partitionOverwriteMode=dynamic \
--conf spark.executor.memoryOverhead=2048 \
--jars /opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/phoenix-spark-5.0.0-cdh6.2.0.jar  \
./phoenix-common-1.0.jar