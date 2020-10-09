
Caused by: com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure

The last packet sent successfully to the server was 0 milliseconds ago. The driver has not received any packets from the server.
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
	at com.mysql.jdbc.Util.handleNewInstance(Util.java:425)
	at com.mysql.jdbc.SQLError.createCommunicationsException(SQLError.java:990)
	at com.mysql.jdbc.MysqlIO.<init>(MysqlIO.java:342)
	at com.mysql.jdbc.ConnectionImpl.coreConnect(ConnectionImpl.java:2188)
	at com.mysql.jdbc.ConnectionImpl.connectOneTryOnly(ConnectionImpl.java:2221)
	at com.mysql.jdbc.ConnectionImpl.createNewIO(ConnectionImpl.java:2016)
	at com.mysql.jdbc.ConnectionImpl.<init>(ConnectionImpl.java:776)
	at com.mysql.jdbc.JDBC4Connection.<init>(JDBC4Connection.java:47)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
	at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
	at com.mysql.jdbc.Util.handleNewInstance(Util.java:425)
	at com.mysql.jdbc.ConnectionImpl.getInstance(ConnectionImpl.java:386)
	at com.mysql.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:330)
	at java.sql.DriverManager.getConnection(DriverManager.java:664)
	at java.sql.DriverManager.getConnection(DriverManager.java:247)
	at org.apache.sqoop.mapreduce.db.DBConfiguration.getConnection(DBConfiguration.java:300)
	at org.apache.sqoop.mapreduce.db.DBInputFormat.getConnection(DBInputFormat.java:213)
	... 11 more
Caused by: java.net.ConnectException: Connection timed out (Connection timed out)
	at java.net.PlainSocketImpl.socketConnect(Native Method)
	at java.net.AbstractPlainSocketImpl.doConnect(AbstractPlainSocketImpl.java:350)
	at java.net.AbstractPlainSocketImpl.connectToAddress(AbstractPlainSocketImpl.java:206)
	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:188)
	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)
	at java.net.Socket.connect(Socket.java:589)
	at com.mysql.jdbc.StandardSocketFactory.connect(StandardSocketFactory.java:211)
	at com.mysql.jdbc.MysqlIO.<init>(MysqlIO.java:301)
	

https://www.itread01.com/content/1546208468.html
在sqoop所有节点添加mysql驱动依赖

/opt/cloudera/parcels/CDH/lib/sqoop/lib/mysql-connector-java-5.1.46.jar