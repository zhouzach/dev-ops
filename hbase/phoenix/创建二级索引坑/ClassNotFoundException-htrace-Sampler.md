
15:43:33.174 [main] INFO  org.apache.hadoop.mapreduce.Job - Task Id : attempt_1597131687908_0001_m_000009_0, Status : FAILED
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

15:43:33.202 [main] INFO  org.apache.hadoop.mapreduce.Job - Task Id : attempt_1597131687908_0001_m_000007_0, Status : FAILED
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

拷贝如下两个包，到每个Hbase RegionServer的/opt/cloudera/parcels/CDH/lib/hbase/lib
phoenix-core-5.0.0-cdh6.2.0.jar	
phoenix-5.0.0-cdh6.2.0-server.jar

cp /opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-server.jar /opt/cloudera/parcels/CDH/lib/hbase/lib
rsync /opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-server.jar cdh4:/opt/cloudera/parcels/CDH/lib/hbase/lib
rsync /opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-server.jar cdh2:/opt/cloudera/parcels/CDH/lib/hbase/lib
rsync /opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-server.jar cdh1:/opt/cloudera/parcels/CDH/lib/hbase/lib
