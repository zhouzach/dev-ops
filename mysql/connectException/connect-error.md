
2022-05-07 11:50:44.176 ERROR 25359 --- [           main] com.zaxxer.hikari.pool.HikariPool        : DolphinScheduler - Exception during pool initialization.

com.mysql.cj.jdbc.exceptions.CommunicationsException: Communications link failure

The last packet sent successfully to the server was 0 milliseconds ago. The driver has not received any packets from the server.
at com.mysql.cj.jdbc.exceptions.SQLError.createCommunicationsException(SQLError.java:174) ~[mysql-connector-java-8.0.16.jar:8.0.16]
at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:64) ~[mysql-connector-java-8.0.16.jar:8.0.16]
at com.mysql.cj.jdbc.ConnectionImpl.createNewIO(ConnectionImpl.java:835) ~[mysql-connector-java-8.0.16.jar:8.0.16]
at com.mysql.cj.jdbc.ConnectionImpl.<init>(ConnectionImpl.java:455) ~[mysql-connector-java-8.0.16.jar:8.0.16]
at com.mysql.cj.jdbc.ConnectionImpl.getInstance(ConnectionImpl.java:240) ~[mysql-connector-java-8.0.16.jar:8.0.16]
at com.mysql.cj.jdbc.NonRegisteringDriver.connect(NonRegisteringDriver.java:199) ~[mysql-connector-java-8.0.16.jar:8.0.16]
at com.zaxxer.hikari.util.DriverDataSource.getConnection(DriverDataSource.java:138) ~[HikariCP-4.0.3.jar:na]
at com.zaxxer.hikari.pool.PoolBase.newConnection(PoolBase.java:364) ~[HikariCP-4.0.3.jar:na]
at com.zaxxer.hikari.pool.PoolBase.newPoolEntry(PoolBase.java:206) ~[HikariCP-4.0.3.jar:na]
at com.zaxxer.hikari.pool.HikariPool.createPoolEntry(HikariPool.java:476) [HikariCP-4.0.3.jar:na]
at com.zaxxer.hikari.pool.HikariPool.checkFailFast(HikariPool.java:561) [HikariCP-4.0.3.jar:na]
at com.zaxxer.hikari.pool.HikariPool.<init>(HikariPool.java:115) [HikariCP-4.0.3.jar:na]
at com.zaxxer.hikari.HikariDataSource.getConnection(HikariDataSource.java:112) [HikariCP-4.0.3.jar:na]
at org.apache.dolphinscheduler.tools.datasource.DolphinSchedulerManager.getCurrentDbType(DolphinSchedulerManager.java:51) [dolphinscheduler-tools-3.0.0-alpha.jar:3.0.0-alpha]
at org.apache.dolphinscheduler.tools.datasource.DolphinSchedulerManager.<init>(DolphinSchedulerManager.java:41) [dolphinscheduler-tools-3.0.0-alpha.jar:3.0.0-alpha]


localhost改成ip
url: jdbc:mysql://192.168.100.16:3306/dolphinscheduler?useUnicode=true&characterEncoding=UTF-8