
Caused by: org.apache.flink.client.program.ProgramInvocationException: The main method caused an error: Embedded metastore is not allowed. Make sure you have set a valid value for hive.metastore.uris
	at org.apache.flink.client.program.PackagedProgram.callMainMethod(PackagedProgram.java:302) ~[flink-clients_2.11-1.11.0.jar:1.11.0]
	at org.apache.flink.client.program.PackagedProgram.invokeInteractiveModeForExecution(PackagedProgram.java:198) ~[flink-clients_2.11-1.11.0.jar:1.11.0]
	at org.apache.flink.client.ClientUtils.executeProgram(ClientUtils.java:149) ~[flink-clients_2.11-1.11.0.jar:1.11.0]
	at org.apache.flink.client.deployment.application.ApplicationDispatcherBootstrap.runApplicationEntryPoint(ApplicationDispatcherBootstrap.java:230) ~[flink-clients_2.11-1.11.0.jar:1.11.0]
	... 10 more
Caused by: java.lang.IllegalArgumentException: Embedded metastore is not allowed. Make sure you have set a valid value for hive.metastore.uris
	at org.apache.flink.util.Preconditions.checkArgument(Preconditions.java:139) ~[qile-data-flow-1.0.jar:?]
	



1.安装 hive 的 metastore 后，在你 hivehome/conf/hive-site.xml 文件中添加这样一个配置：
  <property>
    <name>hive.metastore.uris</name>
    <value>thrift://xxxx:9083</value>
    <description>Thrift URI for the remote metastore. Used by metastore client to connect to remote metastore.</description>
  </property>
一般生产环境应该也是这样配置，
然后 Flink 对接到hive配置参考[1]，应该和你之前用的没啥变化，就是不支持 embedded 的 metastore

[1] https://ci.apache.org/projects/flink/flink-docs-release-1.11/dev/table/hive/#connecting-to-hive <https://ci.apache.org/projects/flink/flink-docs-release-1.11/dev/table/hive/#connecting-to-hive>

2.Configuring the Metastore Database
https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/cdh_ig_hive_metastore_configure.html#configure_metastore_db