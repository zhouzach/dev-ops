
22/04/28 14:53:04 INFO hive.metastore: HMS client filtering is enabled.
22/04/28 14:53:04 INFO hive.metastore: Trying to connect to metastore with URI thrift://dm-host118:9083
22/04/28 14:53:04 INFO hive.metastore: Opened a connection to metastore, current connections: 1
22/04/28 14:53:04 INFO hive.metastore: Connected to metastore.
22/04/28 14:53:04 WARN metastore.RetryingMetaStoreClient: MetaStoreClient lost connection. Attempting to reconnect.
org.apache.thrift.transport.TTransportException: Cannot write to null outputStream
at org.apache.thrift.transport.TIOStreamTransport.write(TIOStreamTransport.java:142)
at org.apache.thrift.protocol.TBinaryProtocol.writeI32(TBinaryProtocol.java:178)
at org.apache.thrift.protocol.TBinaryProtocol.writeMessageBegin(TBinaryProtocol.java:106)
at org.apache.thrift.TServiceClient.sendBase(TServiceClient.java:70)
at org.apache.thrift.TServiceClient.sendBase(TServiceClient.java:62)
at org.apache.hadoop.hive.metastore.api.ThriftHiveMetastore$Client.send_get_partition_with_auth(ThriftHiveMetastore.java:2221)
at org.apache.hadoop.hive.metastore.api.ThriftHiveMetastore$Client.get_partition_with_auth(ThriftHiveMetastore.java:2209)
at org.apache.hadoop.hive.metastore.HiveMetaStoreClient.getPartitionWithAuthInfo(HiveMetaStoreClient.java:1559)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
at java.lang.reflect.Method.invoke(Method.java:498)
at org.apache.hadoop.hive.metastore.RetryingMetaStoreClient.invoke(RetryingMetaStoreClient.java:154)
at com.sun.proxy.$Proxy34.getPartitionWithAuthInfo(Unknown Source)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
at java.lang.reflect.Method.invoke(Method.java:498)
at org.apache.hadoop.hive.metastore.HiveMetaStoreClient$SynchronizedHandler.invoke(HiveMetaStoreClient.java:2562)
at com.sun.proxy.$Proxy34.getPartitionWithAuthInfo(Unknown Source)
at org.apache.hadoop.hive.ql.metadata.Hive.getPartition(Hive.java:2311)
at org.apache.hadoop.hive.ql.metadata.Hive.getPartition(Hive.java:2252)
at org.apache.hadoop.hive.ql.parse.BaseSemanticAnalyzer$TableSpec.<init>(BaseSemanticAnalyzer.java:1094)
at org.apache.hadoop.hive.ql.parse.BaseSemanticAnalyzer$TableSpec.<init>(BaseSemanticAnalyzer.java:976)
at org.apache.hadoop.hive.ql.parse.LoadSemanticAnalyzer.analyzeInternal(LoadSemanticAnalyzer.java:210)
at org.apache.hadoop.hive.ql.parse.BaseSemanticAnalyzer.analyze(BaseSemanticAnalyzer.java:250)
at org.apache.hadoop.hive.ql.Driver.compile(Driver.java:603)
at org.apache.hadoop.hive.ql.Driver.compileInternal(Driver.java:1425)
at org.apache.hadoop.hive.ql.Driver.runInternal(Driver.java:1493)
at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1339)
at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1328)
at org.apache.hadoop.hive.cli.CliDriver.processLocalCmd(CliDriver.java:239)
at org.apache.hadoop.hive.cli.CliDriver.processCmd(CliDriver.java:187)
at org.apache.hadoop.hive.cli.CliDriver.processLine(CliDriver.java:409)
at org.apache.hadoop.hive.cli.CliDriver.processLine(CliDriver.java:342)
at org.apache.hadoop.hive.cli.CliDriver.processReader(CliDriver.java:487)
at org.apache.hadoop.hive.cli.CliDriver.processFile(CliDriver.java:503)
at org.apache.hadoop.hive.cli.CliDriver.executeDriver(CliDriver.java:806)
at org.apache.hadoop.hive.cli.CliDriver.run(CliDriver.java:772)
at org.apache.hadoop.hive.cli.CliDriver.main(CliDriver.java:699)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
at java.lang.reflect.Method.invoke(Method.java:498)
at org.apache.hadoop.util.RunJar.run(RunJar.java:313)
at org.apache.hadoop.util.RunJar.main(RunJar.java:227)
22/04/28 14:53:05 INFO hive.metastore: Trying to connect to metastore with URI thrift://dm-host118:9083
22/04/28 14:53:05 INFO hive.metastore: Opened a connection to metastore, current connections: 2
22/04/28 14:53:05 INFO hive.metastore: Connected to metastore.