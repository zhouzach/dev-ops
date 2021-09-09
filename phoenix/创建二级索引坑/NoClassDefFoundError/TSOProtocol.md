
java.lang.NoClassDefFoundError: org/apache/omid/tso/client/TSOProtocol
	at org.apache.phoenix.transaction.TransactionFactory$Provider.<clinit>(TransactionFactory.java:29)
	at org.apache.phoenix.query.QueryServicesOptions.<clinit>(QueryServicesOptions.java:277)
	at org.apache.phoenix.query.QueryServicesImpl.<init>(QueryServicesImpl.java:36)
	at org.apache.phoenix.jdbc.PhoenixDriver.getQueryServices(PhoenixDriver.java:197)
	at org.apache.phoenix.jdbc.PhoenixDriver.getConnectionQueryServices(PhoenixDriver.java:235)
	at org.apache.phoenix.jdbc.PhoenixEmbeddedDriver.createConnection(PhoenixEmbeddedDriver.java:144)
	at org.apache.phoenix.jdbc.PhoenixDriver.connect(PhoenixDriver.java:221)
	at java.sql.DriverManager.getConnection(DriverManager.java:664)
	at java.sql.DriverManager.getConnection(DriverManager.java:208)
	at org.apache.phoenix.mapreduce.util.ConnectionUtil.getConnection(ConnectionUtil.java:113)
	at org.apache.phoenix.mapreduce.util.ConnectionUtil.getInputConnection(ConnectionUtil.java:58)
	at org.apache.phoenix.mapreduce.util.ConnectionUtil.getInputConnection(ConnectionUtil.java:46)
	at org.apache.phoenix.mapreduce.index.IndexTool.getConnection(IndexTool.java:910)
	at org.apache.phoenix.mapreduce.index.IndexTool.run(IndexTool.java:772)
	at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:76)
	at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:90)
	at org.apache.phoenix.mapreduce.index.IndexTool.main(IndexTool.java:1173)
Caused by: java.lang.ClassNotFoundException: org.apache.omid.tso.client.TSOProtocol
	at java.net.URLClassLoader.findClass(URLClassLoader.java:381)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:424)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:338)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:357)
	
	
	
下载，omid-transaction-client-1.0.1.jar，添加到HBASE_CLASSPATH_PREFIX