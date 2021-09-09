
15:44:49.845 [ERROR - main] (IndexTool.java:610) An exception occurred while performing the indexing job: SQLException: ERROR 2006 (INT08): Incompatible jars detected between client and server. Ensure that phoenix-[version]-server.jar is put on the classpath of HBase in every region server: Can't find method newStub in org.apache.phoenix.coprocessor.generated.MetaDataProtos$MetaDataService! at:
java.sql.SQLException: ERROR 2006 (INT08): Incompatible jars detected between client and server. Ensure that phoenix-[version]-server.jar is put on the classpath of HBase in every region server: Can't find method newStub in org.apache.phoenix.coprocessor.generated.MetaDataProtos$MetaDataService!
	at org.apache.phoenix.exception.SQLExceptionCode$Factory$1.newException(SQLExceptionCode.java:497)
	at org.apache.phoenix.exception.SQLExceptionInfo.buildException(SQLExceptionInfo.java:150)
	at org.apache.phoenix.query.ConnectionQueryServicesImpl.checkClientServerCompatibility(ConnectionQueryServicesImpl.java:1327)
	at org.apache.phoenix.query.ConnectionQueryServicesImpl.ensureTableCreated(ConnectionQueryServicesImpl.java:1163)
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
Caused by: java.lang.IllegalArgumentException: Can't find method newStub in org.apache.phoenix.coprocessor.generated.MetaDataProtos$MetaDataService!
	at org.apache.hadoop.hbase.util.Methods.call(Methods.java:47)
	at org.apache.hadoop.hbase.protobuf.ProtobufUtil.newServiceStub(ProtobufUtil.java:1537)
	at org.apache.hadoop.hbase.client.HTable$12.call(HTable.java:996)
	at java.util.concurrent.FutureTask.run(FutureTask.java:266)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)
Caused by: java.lang.NoSuchMethodException: org.apache.phoenix.coprocessor.generated.MetaDataProtos$MetaDataService.newStub(org.apache.hadoop.hbase.shaded.com.google.protobuf.RpcChannel)
	at java.lang.Class.getMethod(Class.java:1786)
	at org.apache.hadoop.hbase.util.Methods.call(Methods.java:39)
	

1.删除HBASE_CLASSPATH_PREFIX中的/opt/cloudera/parcels/CDH/jars
2.phoenix-[version]-server.jar is put on the classpath of HBase in every region server
cp /opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-server.jar /opt/cloudera/parcels/CDH/lib/hbase/lib
rsync /opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-server.jar cdh4:/opt/cloudera/parcels/CDH/lib/hbase/lib
rsync /opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-server.jar cdh2:/opt/cloudera/parcels/CDH/lib/hbase/lib
rsync /opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-server.jar cdh1:/opt/cloudera/parcels/CDH/lib/hbase/lib

3.然后执行
HBASE_CLASSPATH_PREFIX=/opt/cloudera/parcels/CDH/lib/hbase/lib/htrace-core-3.1.0-incubating.jar:/opt/cloudera/parcels/CDH/jars/commons-cli-1.4.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-zookeeper-0.8.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-discovery-api-0.8.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/joda-time-2.9.9.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/antlr-runtime-3.4.jar \
/opt/cloudera/parcels/CDH/lib/hbase/bin/hbase org.apache.phoenix.mapreduce.index.IndexTool \
--schema ods --data-table USER_FLINK8 --index-table user_flink8_ctime_idx --output-path hdfs://nameservice1/phoenix
