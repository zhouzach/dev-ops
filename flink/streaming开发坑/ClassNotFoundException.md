

ClassNotFoundException: com.ctc.wstx.io.InputBootstrapper

       <dependency>
            <groupId>org.apache.hadoop</groupId>
            <artifactId>hadoop-common</artifactId>
            <version>3.0.0-cdh6.3.1</version>
        </dependency>
        <!-- https://mvnrepository.com/artifact/org.apache.hadoop/hadoop-hdfs -->
        <dependency>
            <groupId>org.apache.hadoop</groupId>
            <artifactId>hadoop-hdfs</artifactId>
            <version>3.0.0-cdh6.3.1</version>
        </dependency>
        
        
ClassNotFoundException: org.apache.hadoop.mapred.JobConf

        <dependency>
            <groupId>org.apache.hadoop</groupId>
            <artifactId>hadoop-mapreduce-client-core</artifactId>
            <version>3.0.0-cdh6.3.2</version>
        </dependency>
        
        
java.lang.NoClassDefFoundError: Could not initialize class org.apache.hadoop.security.SecurityUtil
如果项目中添加了如下依赖
<dependency>
            <groupId>org.apache.phoenix</groupId>
            <artifactId>phoenix-client</artifactId>
            <version>${phoenix.version}</version>
        </dependency>
 删除/opt/flink-1.11.1/lib下，       
 rm -rf phoenix-client-5.0.0-cdh6.2.0.jar
  rm -rf phoenix-5.0.0-cdh6.2.0-client.jar
  
  
  



java.lang.reflect.InvocationTargetException: null
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) ~[?:1.8.0_161]
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62) ~[?:1.8.0_161]
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) ~[?:1.8.0_161]
	at java.lang.reflect.Method.invoke(Method.java:498) ~[?:1.8.0_161]
	at org.apache.flink.runtime.util.EnvironmentInformation.getHadoopUser(EnvironmentInformation.java:201) [qile-data-flow-1.0.jar:?]
	at org.apache.flink.runtime.util.EnvironmentInformation.logEnvironmentInfo(EnvironmentInformation.java:399) [qile-data-flow-1.0.jar:?]
	at org.apache.flink.yarn.entrypoint.YarnApplicationClusterEntryPoint.main(YarnApplicationClusterEntryPoint.java:67) [flink-dist_2.11-1.11.1.jar:1.11.1]
Caused by: java.lang.NoSuchMethodError: com.ctc.wstx.stax.WstxInputFactory.createSR(Lcom/ctc/wstx/api/ReaderConfig;Lcom/ctc/wstx/io/SystemId;Lcom/ctc/wstx/io/InputBootstrapper;ZZ)Lorg/codehaus/stax2/XMLStreamReader2;
	at org.apache.hadoop.conf.Configuration.parse(Configuration.java:2829) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.conf.Configuration.parse(Configuration.java:2813) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.conf.Configuration.getStreamReader(Configuration.java:2906) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.conf.Configuration.loadResource(Configuration.java:2864) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.conf.Configuration.loadResources(Configuration.java:2838) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.conf.Configuration.getProps(Configuration.java:2715) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.conf.Configuration.get(Configuration.java:1186) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.conf.Configuration.getTrimmed(Configuration.java:1240) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.conf.Configuration.getBoolean(Configuration.java:1646) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.security.SecurityUtil.setConfigurationInternal(SecurityUtil.java:97) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.security.SecurityUtil.<clinit>(SecurityUtil.java:86) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.security.UserGroupInformation.initialize(UserGroupInformation.java:326) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.security.UserGroupInformation.ensureInitialized(UserGroupInformation.java:314) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.security.UserGroupInformation.doSubjectLogin(UserGroupInformation.java:1973) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.security.UserGroupInformation.createLoginUser(UserGroupInformation.java:743) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.security.UserGroupInformation.getLoginUser(UserGroupInformation.java:693) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
	at org.apache.hadoop.security.UserGroupInformation.getCurrentUser(UserGroupInformation.java:604) ~[hadoop-common-3.0.0-cdh6.3.2.jar:?]
在flink集群每个节点，
rm -rf /opt/flink-1.11.1/lib/hadoop-common-3.0.0-cdh6.3.2.jar



Caused by: java.lang.ClassNotFoundException: org.apache.phoenix.jdbc.PhoenixDriver
	at java.net.URLClassLoader.findClass(URLClassLoader.java:381) ~[?:1.8.0_161]
	at java.lang.ClassLoader.loadClass(ClassLoader.java:424) ~[?:1.8.0_161]
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:338) ~[?:1.8.0_161]
	at java.lang.ClassLoader.loadClass(ClassLoader.java:357) ~[?:1.8.0_161]
	at java.lang.Class.forName0(Native Method) ~[?:1.8.0_161]
	at java.lang.Class.forName(Class.java:264) ~[?:1.8.0_161]
	at cn.ibobei.qile.dataflow.connectors.phoenix.PhoenixRichSinkFunction.open(PhoenixRichSinkFunction.scala:46) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.api.common.functions.util.FunctionUtils.openFunction(FunctionUtils.java:36) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.api.operators.AbstractUdfStreamOperator.open(AbstractUdfStreamOperator.java:102) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.api.operators.StreamSink.open(StreamSink.java:48) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.runtime.tasks.OperatorChain.initializeStateAndOpenOperators(OperatorChain.java:291) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.runtime.tasks.StreamTask.lambda$beforeInvoke$0(StreamTask.java:473) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.runtime.tasks.StreamTaskActionExecutor$1.runThrowing(StreamTaskActionExecutor.java:47) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.runtime.tasks.StreamTask.beforeInvoke(StreamTask.java:469) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.runtime.tasks.StreamTask.invoke(StreamTask.java:522) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.runtime.taskmanager.Task.doRun(Task.java:721) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.runtime.taskmanager.Task.run(Task.java:546) ~[qile-data-flow-1.0.jar:?]

在flink集群/opt/flink-1.11.1/lib目录下添加与项目所依赖一致的包，phoenix-client-5.0.0-cdh6.2.0.jar





邮件列表
java.io.IOException: unable to open JDBC writer
	at org.apache.flink.connector.jdbc.internal.AbstractJdbcOutputFormat.open(AbstractJdbcOutputFormat.java:61) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
	at org.apache.flink.connector.jdbc.internal.JdbcBatchingOutputFormat.open(JdbcBatchingOutputFormat.java:112) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
	at org.apache.flink.connector.jdbc.internal.GenericJdbcSinkFunction.open(GenericJdbcSinkFunction.java:50) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
	at org.apache.flink.api.common.functions.util.FunctionUtils.openFunction(FunctionUtils.java:36) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.api.operators.AbstractUdfStreamOperator.open(AbstractUdfStreamOperator.java:102) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.api.operators.StreamSink.open(StreamSink.java:48) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.runtime.tasks.OperatorChain.initializeStateAndOpenOperators(OperatorChain.java:291) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.runtime.tasks.StreamTask.lambda$beforeInvoke$0(StreamTask.java:473) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.runtime.tasks.StreamTaskActionExecutor$1.runThrowing(StreamTaskActionExecutor.java:47) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.runtime.tasks.StreamTask.beforeInvoke(StreamTask.java:469) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.streaming.runtime.tasks.StreamTask.invoke(StreamTask.java:522) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.runtime.taskmanager.Task.doRun(Task.java:721) ~[qile-data-flow-1.0.jar:?]
	at org.apache.flink.runtime.taskmanager.Task.run(Task.java:546) ~[qile-data-flow-1.0.jar:?]
	at java.lang.Thread.run(Thread.java:748) ~[?:1.8.0_161]
Caused by: java.lang.RuntimeException: Failed to construct AvaticaHttpClient implementation org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.AvaticaCommonsHttpClientImpl
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.AvaticaHttpClientFactoryImpl.instantiateClient(AvaticaHttpClientFactoryImpl.java:126) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.AvaticaHttpClientFactoryImpl.getClient(AvaticaHttpClientFactoryImpl.java:68) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.getHttpClient(Driver.java:160) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.createService(Driver.java:123) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.createMeta(Driver.java:97) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.AvaticaConnection.<init>(AvaticaConnection.java:121) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.AvaticaJdbc41Factory$AvaticaJdbc41Connection.<init>(AvaticaJdbc41Factory.java:105) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.AvaticaJdbc41Factory.newConnection(AvaticaJdbc41Factory.java:62) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.UnregisteredDriver.connect(UnregisteredDriver.java:138) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.connect(Driver.java:165) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at java.sql.DriverManager.getConnection(DriverManager.java:664) ~[?:1.8.0_161]
	at java.sql.DriverManager.getConnection(DriverManager.java:270) ~[?:1.8.0_161]
	at org.apache.flink.connector.jdbc.internal.connection.SimpleJdbcConnectionProvider.getConnection(SimpleJdbcConnectionProvider.java:56) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
	at org.apache.flink.connector.jdbc.internal.AbstractJdbcOutputFormat.establishConnection(AbstractJdbcOutputFormat.java:66) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
	at org.apache.flink.connector.jdbc.internal.AbstractJdbcOutputFormat.open(AbstractJdbcOutputFormat.java:59) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
	... 13 more
Caused by: java.lang.reflect.InvocationTargetException
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method) ~[?:1.8.0_161]
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62) ~[?:1.8.0_161]
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45) ~[?:1.8.0_161]
	at java.lang.reflect.Constructor.newInstance(Constructor.java:423) ~[?:1.8.0_161]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.AvaticaHttpClientFactoryImpl.instantiateClient(AvaticaHttpClientFactoryImpl.java:123) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.AvaticaHttpClientFactoryImpl.getClient(AvaticaHttpClientFactoryImpl.java:68) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.getHttpClient(Driver.java:160) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.createService(Driver.java:123) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.createMeta(Driver.java:97) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.AvaticaConnection.<init>(AvaticaConnection.java:121) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.AvaticaJdbc41Factory$AvaticaJdbc41Connection.<init>(AvaticaJdbc41Factory.java:105) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.AvaticaJdbc41Factory.newConnection(AvaticaJdbc41Factory.java:62) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.UnregisteredDriver.connect(UnregisteredDriver.java:138) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.connect(Driver.java:165) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at java.sql.DriverManager.getConnection(DriverManager.java:664) ~[?:1.8.0_161]
	at java.sql.DriverManager.getConnection(DriverManager.java:270) ~[?:1.8.0_161]
	at org.apache.flink.connector.jdbc.internal.connection.SimpleJdbcConnectionProvider.getConnection(SimpleJdbcConnectionProvider.java:56) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
	at org.apache.flink.connector.jdbc.internal.AbstractJdbcOutputFormat.establishConnection(AbstractJdbcOutputFormat.java:66) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
	at org.apache.flink.connector.jdbc.internal.AbstractJdbcOutputFormat.open(AbstractJdbcOutputFormat.java:59) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
	... 13 more
Caused by: java.lang.NoClassDefFoundError: Could not initialize class org.apache.phoenix.shaded.org.apache.http.impl.conn.ManagedHttpClientConnectionFactory
	at org.apache.phoenix.shaded.org.apache.http.impl.conn.PoolingHttpClientConnectionManager$InternalConnectionFactory.<init>(PoolingHttpClientConnectionManager.java:586) ~[phoenix-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.http.impl.conn.PoolingHttpClientConnectionManager.<init>(PoolingHttpClientConnectionManager.java:180) ~[phoenix-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.http.impl.conn.PoolingHttpClientConnectionManager.<init>(PoolingHttpClientConnectionManager.java:164) ~[phoenix-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.http.impl.conn.PoolingHttpClientConnectionManager.<init>(PoolingHttpClientConnectionManager.java:155) ~[phoenix-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.http.impl.conn.PoolingHttpClientConnectionManager.<init>(PoolingHttpClientConnectionManager.java:131) ~[phoenix-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.AvaticaCommonsHttpClientImpl.initializeClient(AvaticaCommonsHttpClientImpl.java:120) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.AvaticaCommonsHttpClientImpl.<init>(AvaticaCommonsHttpClientImpl.java:94) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method) ~[?:1.8.0_161]
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62) ~[?:1.8.0_161]
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45) ~[?:1.8.0_161]
	at java.lang.reflect.Constructor.newInstance(Constructor.java:423) ~[?:1.8.0_161]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.AvaticaHttpClientFactoryImpl.instantiateClient(AvaticaHttpClientFactoryImpl.java:123) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.AvaticaHttpClientFactoryImpl.getClient(AvaticaHttpClientFactoryImpl.java:68) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.getHttpClient(Driver.java:160) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.createService(Driver.java:123) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.createMeta(Driver.java:97) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.AvaticaConnection.<init>(AvaticaConnection.java:121) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.AvaticaJdbc41Factory$AvaticaJdbc41Connection.<init>(AvaticaJdbc41Factory.java:105) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.AvaticaJdbc41Factory.newConnection(AvaticaJdbc41Factory.java:62) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.UnregisteredDriver.connect(UnregisteredDriver.java:138) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at org.apache.phoenix.shaded.org.apache.calcite.avatica.remote.Driver.connect(Driver.java:165) ~[phoenix-thin-client-5.0.0-cdh6.2.0.jar:?]
	at java.sql.DriverManager.getConnection(DriverManager.java:664) ~[?:1.8.0_161]
	at java.sql.DriverManager.getConnection(DriverManager.java:270) ~[?:1.8.0_161]
	at org.apache.flink.connector.jdbc.internal.connection.SimpleJdbcConnectionProvider.getConnection(SimpleJdbcConnectionProvider.java:56) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
	at org.apache.flink.connector.jdbc.internal.AbstractJdbcOutputFormat.establishConnection(AbstractJdbcOutputFormat.java:66) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
	at org.apache.flink.connector.jdbc.internal.AbstractJdbcOutputFormat.open(AbstractJdbcOutputFormat.java:59) ~[flink-connector-jdbc_2.11-1.11.1.jar:1.11.1]
