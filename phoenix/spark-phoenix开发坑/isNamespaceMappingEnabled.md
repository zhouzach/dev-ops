
http://apache-phoenix-user-list.1124778.n5.nabble.com/client-does-not-have-phoenix-schema-isNamespaceMappingEnabled-td4962.html



20/08/10 17:25:48 WARN scheduler.TaskSetManager: Lost task 0.0 in stage 0.0 (TID 0, qile-test-cdh004, executor 4): java.sql.SQLException: ERROR 726 (43M10):  Inconsistent namespace mapping properties. Cannot initiate connection as SYSTEM:CATALOG is found but client does not have phoenix.schema.isNamespaceMappingEnabled enabled

Lost task 2.1 in stage 0.0 (TID 14, qile-test-cdh001, executor 2): java.sql.SQLException: ERROR 726 (43M10):  Inconsistent namespace mapping properties. Cannot initiate connection as SYSTEM:CATALOG is found but client does not have phoenix.schema.isNamespaceMappingEnabled enabled

1.将/etc/hbase/conf/hbase-site.xml从Hbase节点拷贝到spark 所有节点的/etc/hbase/conf/
2.spark-submit \
--files "/etc/hbase/conf/hbase-site.xml" \




类冲突,更改SPARK_DIST_CLASSPATH参数 
将下面的值
export SPARK_DIST_CLASSPATH=${SPARK_DIST_CLASSPATH}:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/phoenix-core-5.0.0-cdh6.2.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-zookeeper-0.8.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-discovery-api-0.8.0.jar:/opt/cloudera/parcels/CDH/lib/hbase/lib/htrace-core-3.1.0-incubating.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/tephra-core-0.14.0-incubating.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/antlr-runtime-3.4.jar
更改为
export SPARK_DIST_CLASSPATH=${SPARK_DIST_CLASSPATH}:/opt/cloudera/parcels/CDH/lib/hbase/lib/htrace-core-3.1.0-incubating.jar:/opt/cloudera/parcels/CDH/jars/commons-cli-1.4.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-zookeeper-0.8.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-discovery-api-0.8.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/joda-time-2.9.9.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/antlr-runtime-3.4.jar



