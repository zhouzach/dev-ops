https://github.com/hortonworks-spark/spark-atlas-connector/tree/branch-2.4
https://blog.csdn.net/weixin_43899386/article/details/107565820


1.三个地方修改
hive-site.xml 的 Hive 服务高级配置代码段（安全阀）
hive.exec.post.hooks
org.apache.atlas.hive.hook.HiveHook,org.apache.hadoop.hive.ql.hooks.LineageLogger

hive-site.xml 的 Hive 客户端高级配置代码段（安全阀）
hive.exec.post.hooks
org.apache.atlas.hive.hook.HiveHook,org.apache.hadoop.hive.ql.hooks.LineageLogger


hive-site.xml 的 HiveServer2 高级配置代码段（安全阀）
hive.exec.post.hooks
org.apache.atlas.hive.hook.HiveHook,org.apache.hadoop.hive.ql.hooks.LineageLogger

2.编译spark-atlas-connector
git clone git@github.com:hortonworks-spark/spark-atlas-connector.git
mvn package -DskipTests
scp spark-atlas-connector/target/spark-atlas-connector_2.11-0.1.0-SNAPSHOT.jar root@192.168.100.118:/data/app/spark


3.下载依赖
https://repo.maven.apache.org/maven2/org/apache/spark/spark-hive-thriftserver_2.11/2.4.0/spark-hive-thriftserver_2.11-2.4.0.jar
scp spark-hive-thriftserver_2.11-2.4.0.jar  root@192.168.100.118:/data/app/spark


4.test
spark-submit \
--class com.dm.datawarehouse.Main \
--name create-table \
--master yarn \
--deploy-mode client \
--driver-memory 1g \
--num-executors 2 \
--executor-cores 1 \
--executor-memory 2g \
--conf spark.sql.hive.caseSensitiveInferenceMode=INFER_ONLY \
--conf spark.lineage.enabled=false \
--conf spark.sql.sources.partitionOverwriteMode=dynamic \
--conf spark.executor.memoryOverhead=1024 \
--jars /data/app/spark/spark-hive-thriftserver_2.11-2.4.0.jar,/data/opt/apache-atlas-2.1.0/hook/hive/atlas-hive-plugin-impl/atlas-notification-2.1.0.jar,/data/opt/apache-atlas-2.1.0/hook/hive/atlas-hive-plugin-impl/commons-configuration-1.10.jar,/data/opt/apache-atlas-2.1.0/hook/hive/atlas-hive-plugin-impl/atlas-common-2.1.0.jar,/data/opt/apache-atlas-2.1.0/hook/hive/atlas-hive-plugin-impl/atlas-intg-2.1.0.jar,/data/app/spark/spark-atlas-connector_2.11-0.1.0-SNAPSHOT.jar \
--conf spark.extraListeners=com.hortonworks.spark.atlas.SparkAtlasEventTracker \
--conf spark.sql.queryExecutionListeners=com.hortonworks.spark.atlas.SparkAtlasEventTracker \
--conf spark.sql.streaming.streamingQueryListeners=com.hortonworks.spark.atlas.SparkAtlasStreamingQueryEventTracker \
--files /data/opt/apache-atlas-2.1.0/conf/atlas-application.properties \
/data/app/spark/data-warehouse-spark-1.0-SNAPSHOT.jar "type:timing" > /var/log/data-warehouse/timing.log 2>&1 &

