spark-conf/spark-defaults.conf 的 Spark 客户端高级配置代码段（安全阀）
spark.executor.extraClassPath=/opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-client.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/phoenix-spark-5.0.0-cdh6.2.0.jar
spark.driver.extraClassPath=/opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-client.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/phoenix-spark-5.0.0-cdh6.2.0.jar





spark-conf/spark-env.sh 的 Spark 客户端高级配置代码段（安全阀）
export SPARK_DIST_CLASSPATH=${SPARK_DIST_CLASSPATH}:/opt/cloudera/parcels/CDH/lib/hbase/lib/htrace-core.jar:/opt/cloudera/parcels/CDH/jars/commons-cli-1.4.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-zookeeper-0.8.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-discovery-api-0.8.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/joda-time-2.9.9.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/antlr-runtime-3.4.jar
