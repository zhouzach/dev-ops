
Exception in thread "main" org.apache.hadoop.hbase.DoNotRetryIOException: java.lang.NoClassDefFoundError: org/apache/hadoop/tracing/SpanReceiverHost
	at org.apache.hadoop.hbase.client.RpcRetryingCallerImpl.translateException(RpcRetryingCallerImpl.java:220)
	at org.apache.hadoop.hbase.client.RpcRetryingCallerImpl.callWithRetries(RpcRetryingCallerImpl.java:119)
	at org.apache.hadoop.hbase.client.HBaseAdmin.executeCallable(HBaseAdmin.java:3084)
	at org.apache.hadoop.hbase.client.HBaseAdmin.executeCallable(HBaseAdmin.java:3076)
	at org.apache.hadoop.hbase.client.HBaseAdmin.createTableAsync(HBaseAdmin.java:647)
	at org.apache.hadoop.hbase.client.HBaseAdmin.createTable(HBaseAdmin.java:620)
	at org.apache.hadoop.hbase.spark.HBaseRelation.createTable(DefaultSource.scala:175)
	at org.apache.hadoop.hbase.spark.DefaultSource.createRelation(DefaultSource.scala:79)
	at org.apache.spark.sql.execution.datasources.SaveIntoDataSourceCommand.run(SaveIntoDataSourceCommand.scala:45)
	at org.apache.spark.sql.execution.command.ExecutedCommandExec.sideEffectResult$lzycompute(commands.scala:70)
	at org.apache.spark.sql.execution.command.ExecutedCommandExec.sideEffectResult(commands.scala:68)
	at org.apache.spark.sql.execution.command.ExecutedCommandExec.doExecute(commands.scala:86)
	at org.apache.spark.sql.execution.SparkPlan$$anonfun$execute$1.apply(SparkPlan.scala:131)
	at org.apache.spark.sql.execution.SparkPlan$$anonfun$execute$1.apply(SparkPlan.scala:127)
	at org.apache.spark.sql.execution.SparkPlan$$anonfun$executeQuery$1.apply(SparkPlan.scala:155)
	at org.apache.spark.rdd.RDDOperationScope$.withScope(RDDOperationScope.scala:151)
	at org.apache.spark.sql.execution.SparkPlan.executeQuery(SparkPlan.scala:152)
	at org.apache.spark.sql.execution.SparkPlan.execute(SparkPlan.scala:127)
	at org.apache.spark.sql.execution.QueryExecution.toRdd$lzycompute(QueryExecution.scala:80)
	at org.apache.spark.sql.execution.QueryExecution.toRdd(QueryExecution.scala:80)
	at org.apache.spark.sql.DataFrameWriter$$anonfun$runCommand$1.apply(DataFrameWriter.scala:668)
	at org.apache.spark.sql.DataFrameWriter$$anonfun$runCommand$1.apply(DataFrameWriter.scala:668)
	at org.apache.spark.sql.execution.SQLExecution$$anonfun$withNewExecutionId$1.apply(SQLExecution.scala:78)
	at org.apache.spark.sql.execution.SQLExecution$.withSQLConfPropagated(SQLExecution.scala:125)
	at org.apache.spark.sql.execution.SQLExecution$.withNewExecutionId(SQLExecution.scala:73)
	at org.apache.spark.sql.DataFrameWriter.runCommand(DataFrameWriter.scala:668)
	at org.apache.spark.sql.DataFrameWriter.saveToV1Source(DataFrameWriter.scala:276)
	at org.apache.spark.sql.DataFrameWriter.save(DataFrameWriter.scala:270)
	at org.rabbit.spark.SparkDataFrameConnector$.main(SparkDataFrameConnector.scala:37)
	at org.rabbit.spark.SparkDataFrameConnector.main(SparkDataFrameConnector.scala)
Caused by: java.lang.NoClassDefFoundError: org/apache/hadoop/tracing/SpanReceiverHost
	at org.apache.hadoop.hdfs.DFSClient.<init>(DFSClient.java:634)
	at org.apache.hadoop.hdfs.DFSClient.<init>(DFSClient.java:619)
	at org.apache.hadoop.hdfs.DistributedFileSystem.initialize(DistributedFileSystem.java:149)
	at org.apache.hadoop.fs.FileSystem.createFileSystem(FileSystem.java:3288)
	at org.apache.hadoop.fs.FileSystem.access$200(FileSystem.java:123)
	at org.apache.hadoop.fs.FileSystem$Cache.getInternal(FileSystem.java:3337)
	at org.apache.hadoop.fs.FileSystem$Cache.get(FileSystem.java:3305)
	at org.apache.hadoop.fs.FileSystem.get(FileSystem.java:476)
	at org.apache.hadoop.fs.Path.getFileSystem(Path.java:361)
	at org.apache.hadoop.hbase.util.DynamicClassLoader.initTempDir(DynamicClassLoader.java:120)
	at org.apache.hadoop.hbase.util.DynamicClassLoader.<init>(DynamicClassLoader.java:98)
	at org.apache.hadoop.hbase.ipc.RemoteWithExtrasException$ClassLoaderHolder.lambda$static$0(RemoteWithExtrasException.java:56)
	at java.security.AccessController.doPrivileged(Native Method)
	at org.apache.hadoop.hbase.ipc.RemoteWithExtrasException$ClassLoaderHolder.<clinit>(RemoteWithExtrasException.java:55)
	at org.apache.hadoop.hbase.ipc.RemoteWithExtrasException.unwrapRemoteException(RemoteWithExtrasException.java:79)
	at org.apache.hadoop.hbase.shaded.protobuf.ProtobufUtil.makeIOExceptionOfException(ProtobufUtil.java:362)
	at org.apache.hadoop.hbase.shaded.protobuf.ProtobufUtil.handleRemoteException(ProtobufUtil.java:350)
	at org.apache.hadoop.hbase.client.MasterCallable.call(MasterCallable.java:101)
	at org.apache.hadoop.hbase.client.RpcRetryingCallerImpl.callWithRetries(RpcRetryingCallerImpl.java:107)
	... 28 more
Caused by: java.lang.ClassNotFoundException: org.apache.hadoop.tracing.SpanReceiverHost
	at java.net.URLClassLoader.findClass(URLClassLoader.java:382)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:418)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:352)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:351)
	

注释掉hadoop-common依赖
<!--        <dependency>-->
<!--            <groupId>org.apache.hadoop</groupId>-->
<!--            <artifactId>hadoop-common</artifactId>-->
<!--            <version>3.0.0</version>-->
<!--        </dependency>-->