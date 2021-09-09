
Exception in thread "main" java.lang.NoClassDefFoundError: org/apache/commons/cli/DefaultParser
	at org.apache.phoenix.mapreduce.index.IndexTool.parseOptions(IndexTool.java:183)
	at org.apache.phoenix.mapreduce.index.IndexTool.run(IndexTool.java:522)
	at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:76)
	at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:90)
	at org.apache.phoenix.mapreduce.index.IndexTool.main(IndexTool.java:769)
Caused by: java.lang.ClassNotFoundException: org.apache.commons.cli.DefaultParser
	at java.net.URLClassLoader.findClass(URLClassLoader.java:381)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:338)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:357)

https://community.cloudera.com/t5/Support-Questions/Can-t-populate-Phoenix-Index-with-IndexTool/td-p/235852
先下载commons-cli-1.4.jar，
HBASE_CLASSPATH_PREFIX=/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/commons-cli-1.4.jar \
/opt/cloudera/parcels/CDH/lib/hbase/bin/hbase org.apache.phoenix.mapreduce.index.IndexTool \
--schema ods --data-table user_flink7 --index-table user_flink7_ctime_idx --output-path hdfs://nameservice1/phoenix



Exception in thread "main" java.lang.NoClassDefFoundError: org/apache/htrace/SpanReceiver
	at org.apache.phoenix.trace.util.Tracing$Frequency.<clinit>(Tracing.java:73)
	at org.apache.phoenix.query.QueryServicesOptions.<clinit>(QueryServicesOptions.java:230)
	at org.apache.phoenix.query.QueryServicesImpl.<init>(QueryServicesImpl.java:36)
	at org.apache.phoenix.jdbc.PhoenixDriver.getQueryServices(PhoenixDriver.java:197)
	at org.apache.phoenix.jdbc.PhoenixDriver.getConnectionQueryServices(PhoenixDriver.java:235)
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
Caused by: java.lang.ClassNotFoundException: org.apache.htrace.SpanReceiver
	at java.net.URLClassLoader.findClass(URLClassLoader.java:381)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:338)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:357)

17:07:10.535 [main] INFO  org.apache.hadoop.mapreduce.Job - Task Id : attempt_1596790636151_0002_m_000006_0, Status : FAILED
Error: java.lang.ClassNotFoundException: org.apache.htrace.Sampler
	at java.net.URLClassLoader.findClass(URLClassLoader.java:381)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:338)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:357)
	at org.apache.phoenix.trace.util.Tracing$Frequency.<clinit>(Tracing.java:73)
	at org.apache.phoenix.query.QueryServicesOptions.<clinit>(QueryServicesOptions.java:230)
	at org.apache.phoenix.query.QueryServicesImpl.<init>(QueryServicesImpl.java:36)
	at org.apache.phoenix.jdbc.PhoenixDriver.getQueryServices(PhoenixDriver.java:197)
	at org.apache.phoenix.jdbc.PhoenixDriver.getConnectionQueryServices(PhoenixDriver.java:235)
	at org.apache.phoenix.jdbc.PhoenixEmbeddedDriver.createConnection(PhoenixEmbeddedDriver.java:150)
	at org.apache.phoenix.jdbc.PhoenixDriver.connect(PhoenixDriver.java:221)
	at java.sql.DriverManager.getConnection(DriverManager.java:664)
	at java.sql.DriverManager.getConnection(DriverManager.java:208)
	at org.apache.phoenix.mapreduce.util.ConnectionUtil.getConnection(ConnectionUtil.java:113)
	at org.apache.phoenix.mapreduce.util.ConnectionUtil.getInputConnection(ConnectionUtil.java:58)
	at org.apache.phoenix.mapreduce.PhoenixInputFormat.getQueryPlan(PhoenixInputFormat.java:180)
	at org.apache.phoenix.mapreduce.PhoenixInputFormat.createRecordReader(PhoenixInputFormat.java:76)
	at org.apache.hadoop.mapred.MapTask$NewTrackingRecordReader.<init>(MapTask.java:527)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:770)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:347)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:174)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1875)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:168)

17:07:11.545 [main] INFO  org.apache.hadoop.mapreduce.Job - Task Id : attempt_1596790636151_0002_m_000012_0, Status : FAILED
Error: java.lang.ClassNotFoundException: org.apache.htrace.SpanReceiver
	at java.net.URLClassLoader.findClass(URLClassLoader.java:381)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:338)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:357)
	at org.apache.phoenix.trace.util.Tracing$Frequency.<clinit>(Tracing.java:73)
	at org.apache.phoenix.query.QueryServicesOptions.<clinit>(QueryServicesOptions.java:230)
	at org.apache.phoenix.query.QueryServicesImpl.<init>(QueryServicesImpl.java:36)
	at org.apache.phoenix.jdbc.PhoenixDriver.getQueryServices(PhoenixDriver.java:197)
	at org.apache.phoenix.jdbc.PhoenixDriver.getConnectionQueryServices(PhoenixDriver.java:235)
	at org.apache.phoenix.jdbc.PhoenixEmbeddedDriver.createConnection(PhoenixEmbeddedDriver.java:150)
	at org.apache.phoenix.jdbc.PhoenixDriver.connect(PhoenixDriver.java:221)
	at java.sql.DriverManager.getConnection(DriverManager.java:664)
	at java.sql.DriverManager.getConnection(DriverManager.java:208)
	at org.apache.phoenix.mapreduce.util.ConnectionUtil.getConnection(ConnectionUtil.java:113)
	at org.apache.phoenix.mapreduce.util.ConnectionUtil.getInputConnection(ConnectionUtil.java:58)
	at org.apache.phoenix.mapreduce.PhoenixInputFormat.getQueryPlan(PhoenixInputFormat.java:180)
	at org.apache.phoenix.mapreduce.PhoenixInputFormat.createRecordReader(PhoenixInputFormat.java:76)
	at org.apache.hadoop.mapred.MapTask$NewTrackingRecordReader.<init>(MapTask.java:527)
	at org.apache.hadoop.mapred.MapTask.runNewMapper(MapTask.java:770)
	at org.apache.hadoop.mapred.MapTask.run(MapTask.java:347)
	at org.apache.hadoop.mapred.YarnChild$2.run(YarnChild.java:174)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1875)
	at org.apache.hadoop.mapred.YarnChild.main(YarnChild.java:168)
1.rm -rf /opt/cloudera/parcels/CDH/lib/hbase/lib/htrace-core.jar
2.下载htrace-core-3.1.0-incubating.jar,放到/opt/cloudera/parcels/CDH/lib/hbase/lib


Exception in thread "main" java.lang.NoClassDefFoundError: org/apache/twill/zookeeper/ZKClient
	at org.apache.phoenix.transaction.TransactionFactory$Provider.<clinit>(TransactionFactory.java:27)
	at org.apache.phoenix.query.QueryServicesOptions.<clinit>(QueryServicesOptions.java:269)
	at org.apache.phoenix.query.QueryServicesImpl.<init>(QueryServicesImpl.java:36)
	at org.apache.phoenix.jdbc.PhoenixDriver.getQueryServices(PhoenixDriver.java:197)
	at org.apache.phoenix.jdbc.PhoenixDriver.getConnectionQueryServices(PhoenixDriver.java:235)
	at org.apache.phoenix.jdbc.PhoenixEmbeddedDriver.createConnection(PhoenixEmbeddedDriver.java:150)
	at org.apache.phoenix.jdbc.PhoenixDriver.connect(PhoenixDriver.java:221)
	at java.sql.DriverManager.getConnection(DriverManager.java:664)
	at java.sql.DriverManager.getConnection(DriverManager.java:270)
	at org.apache.phoenix.mapreduce.index.automation.PhoenixMRJobSubmitter.getCandidateJobs(PhoenixMRJobSubmitter.java:207)
	at org.apache.phoenix.mapreduce.index.automation.PhoenixMRJobSubmitter.scheduleIndexBuilds(PhoenixMRJobSubmitter.java:241)
	at org.apache.phoenix.mapreduce.index.automation.PhoenixMRJobSubmitter.main(PhoenixMRJobSubmitter.java:334)
Caused by: java.lang.ClassNotFoundException: org.apache.twill.zookeeper.ZKClient
	at java.net.URLClassLoader.findClass(URLClassLoader.java:381)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:338)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:357)
编辑/etc/profile:
export HADOOP_CLASSPATH=`hadoop classpath`:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/*