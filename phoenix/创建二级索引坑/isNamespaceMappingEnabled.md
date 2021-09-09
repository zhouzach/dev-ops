
13:39:54.280 [main] ERROR org.apache.phoenix.mapreduce.index.IndexTool - An exception occurred while performing the indexing job: SQLException: ERROR 726 (43M10):  Inconsistent namespace mapping properties. Cannot initiate connection as SYSTEM:CATALOG is found but client does not have phoenix.schema.isNamespaceMappingEnabled enabled at:
java.sql.SQLException: ERROR 726 (43M10):  Inconsistent namespace mapping properties. Cannot initiate connection as SYSTEM:CATALOG is found but client does not have phoenix.schema.isNamespaceMappingEnabled enabled
	at org.apache.phoenix.exception.SQLExceptionCode$Factory$1.newException(SQLExceptionCode.java:497)
	at org.apache.phoenix.exception.SQLExceptionInfo.buildException(SQLExceptionInfo.java:150)
	at org.apache.phoenix.query.ConnectionQueryServicesImpl.ensureTableCreated(ConnectionQueryServicesImpl.java:1114)
	at org.apache.phoenix.query.ConnectionQueryServicesImpl.createTable(ConnectionQueryServicesImpl.java:1502)
	at org.apache.phoenix.schema.MetaDataClient.createTableInternal(MetaDataClient.java:2721)
	at org.apache.phoenix.schema.MetaDataClient.createTable(MetaDataClient.java:1114)
	at org.apache.phoenix.compile.CreateTableCompiler$1.execute(CreateTableCompiler.java:198)
	at org.apache.phoenix.jdbc.PhoenixStatement$2.call(PhoenixStatement.java:408)
	at org.apache.phoenix.jdbc.PhoenixStatement$2.call(PhoenixStatement.java:391)
	at org.apache.phoenix.call.CallRunner.run(CallRunner.java:53)
	at org.apache.phoenix.jdbc.PhoenixStatement.executeMutation(PhoenixStatement.java:390)
	at org.apache.phoenix.jdbc.PhoenixStatement.executeMutation(PhoenixStatement.java:378)
	at org.apache.phoenix.jdbc.PhoenixStatement.executeUpdate(PhoenixStatement.java:1806)
	at org.apache.phoenix.query.ConnectionQueryServicesImpl$12.call(ConnectionQueryServicesImpl.java:2570)
	at org.apache.phoenix.query.ConnectionQueryServicesImpl$12.call(ConnectionQueryServicesImpl.java:2533)
	at org.apache.phoenix.util.PhoenixContextExecutor.call(PhoenixContextExecutor.java:76)
	at org.apache.phoenix.query.ConnectionQueryServicesImpl.init(ConnectionQueryServicesImpl.java:2533)
	at org.apache.phoenix.jdbc.PhoenixDriver.getConnectionQueryServices(PhoenixDriver.java:255)
	at org.apache.phoenix.jdbc.PhoenixEmbeddedDriver.createConnection(PhoenixEmbeddedDriver.java:150)
	at org.apache.phoenix.jdbc.PhoenixDriver.connect(PhoenixDriver.java:221)
	at java.sql.DriverManager.getConnection(DriverManager.java:664)
	at java.sql.DriverManager.getConnection(DriverManager.java:208)
	at org.apache.phoenix.mapreduce.util.ConnectionUtil.getConnection(ConnectionUtil.java:113)
	at org.apache.phoenix.mapreduce.util.ConnectionUtil.getInputConnection(ConnectionUtil.java:58)
	at org.apache.phoenix.mapreduce.util.ConnectionUtil.getInputConnection(ConnectionUtil.java:46)
	at org.apache.phoenix.mapreduce.index.IndexTool.run(IndexTool.java:536)
	at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:76)
	at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:90)
	at org.apache.phoenix.mapreduce.index.IndexTool.main(IndexTool.java:769)
	
修改HBASE_CLASSPATH_PREFIX参数，
HBASE_CLASSPATH_PREFIX=/opt/cloudera/parcels/CDH/lib/hbase/lib/*:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/* \
/opt/cloudera/parcels/CDH/lib/hbase/bin/hbase org.apache.phoenix.mapreduce.index.IndexTool \
--schema ods --data-table USER_FLINK8 --index-table user_flink8_ctime_idx --output-path hdfs://nameservice1/phoenix

HBASE_CLASSPATH_PREFIX=/opt/cloudera/parcels/CDH/lib/hbase/lib/htrace-core-3.1.0-incubating.jar:/opt/cloudera/parcels/CDH/jars/commons-cli-1.4.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-zookeeper-0.8.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-discovery-api-0.8.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/joda-time-2.9.9.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/antlr-runtime-3.4.jar \
/opt/cloudera/parcels/CDH/lib/hbase/bin/hbase org.apache.phoenix.mapreduce.index.IndexTool \
--schema ods --data-table USER_FLINK8 --index-table user_flink8_ctime_idx --output-path hdfs://nameservice1/phoenix



