2022-04-29 15:11:39,613 ERROR org.apache.flink.runtime.operators.DataSinkTask              [] - Error in user code: Failed to CREATE_FILE /data/app/output/0429-5 for DFSClient_NONMAPREDUCE_60986037_1 on 192.168.100.211 because this file lease is currently owned by DFSClient_NONMAPREDUCE_563177_1 on 192.168.100.214
at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.recoverLeaseInternal(FSNamesystem.java:2571)
at org.apache.hadoop.hdfs.server.namenode.FSDirWriteFileOp.startFile(FSDirWriteFileOp.java:386)
at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.startFileInt(FSNamesystem.java:2420)
at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.startFile(FSNamesystem.java:2318)
at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.create(NameNodeRpcServer.java:771)
at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.create(ClientNamenodeProtocolServerSideTranslatorPB.java:451)
at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:523)
at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:991)
at org.apache.hadoop.ipc.Server$RpcCall.run(Server.java:869)
at org.apache.hadoop.ipc.Server$RpcCall.run(Server.java:815)
at java.security.AccessController.doPrivileged(Native Method)
at javax.security.auth.Subject.doAs(Subject.java:422)
at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1875)
at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2675)
:  DataSink (CsvOutputFormat (path: hdfs:/data/app/output/0429-5, delimiter:  )) (1/1)
org.apache.hadoop.ipc.RemoteException: Failed to CREATE_FILE /data/app/output/0429-5 for DFSClient_NONMAPREDUCE_60986037_1 on 192.168.100.211 because this file lease is currently owned by DFSClient_NONMAPREDUCE_563177_1 on 192.168.100.214
at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.recoverLeaseInternal(FSNamesystem.java:2571)
at org.apache.hadoop.hdfs.server.namenode.FSDirWriteFileOp.startFile(FSDirWriteFileOp.java:386)
at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.startFileInt(FSNamesystem.java:2420)
at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.startFile(FSNamesystem.java:2318)
at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.create(NameNodeRpcServer.java:771)
at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.create(ClientNamenodeProtocolServerSideTranslatorPB.java:451)
at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:523)
at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:991)
at org.apache.hadoop.ipc.Server$RpcCall.run(Server.java:869)
at org.apache.hadoop.ipc.Server$RpcCall.run(Server.java:815)
at java.security.AccessController.doPrivileged(Native Method)
at javax.security.auth.Subject.doAs(Subject.java:422)
at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1875)
at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2675)

	at org.apache.hadoop.ipc.Client.getRpcResponse(Client.java:1499) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.ipc.Client.call(Client.java:1445) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.ipc.Client.call(Client.java:1355) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:228) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.ipc.ProtobufRpcEngine$Invoker.invoke(ProtobufRpcEngine.java:116) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at com.sun.proxy.$Proxy26.create(Unknown Source) ~[?:?]
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.create(ClientNamenodeProtocolTranslatorPB.java:349) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) ~[?:1.8.0_322]
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62) ~[?:1.8.0_322]
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) ~[?:1.8.0_322]
	at java.lang.reflect.Method.invoke(Method.java:498) ~[?:1.8.0_322]
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:422) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.io.retry.RetryInvocationHandler$Call.invokeMethod(RetryInvocationHandler.java:165) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.io.retry.RetryInvocationHandler$Call.invoke(RetryInvocationHandler.java:157) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.io.retry.RetryInvocationHandler$Call.invokeOnce(RetryInvocationHandler.java:95) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:359) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at com.sun.proxy.$Proxy27.create(Unknown Source) ~[?:?]
	at org.apache.hadoop.hdfs.DFSOutputStream.newStreamForCreate(DFSOutputStream.java:276) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DFSClient.create(DFSClient.java:1182) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DFSClient.create(DFSClient.java:1161) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DFSClient.create(DFSClient.java:1099) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DistributedFileSystem$8.doCall(DistributedFileSystem.java:464) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DistributedFileSystem$8.doCall(DistributedFileSystem.java:461) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DistributedFileSystem.create(DistributedFileSystem.java:475) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DistributedFileSystem.create(DistributedFileSystem.java:402) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.fs.FileSystem.create(FileSystem.java:1052) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.fs.FileSystem.create(FileSystem.java:1032) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.fs.FileSystem.create(FileSystem.java:921) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.flink.runtime.fs.hdfs.HadoopFileSystem.create(HadoopFileSystem.java:154) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.fs.hdfs.HadoopFileSystem.create(HadoopFileSystem.java:37) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.core.fs.SafetyNetWrapperFileSystem.create(SafetyNetWrapperFileSystem.java:130) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.api.common.io.FileOutputFormat.open(FileOutputFormat.java:261) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.api.java.io.CsvOutputFormat.open(CsvOutputFormat.java:160) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.operators.DataSinkTask.invoke(DataSinkTask.java:222) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.taskmanager.Task.runWithSystemExitMonitoring(Task.java:958) [flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.taskmanager.Task.restoreAndInvoke(Task.java:937) [flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.taskmanager.Task.doRun(Task.java:766) [flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.taskmanager.Task.run(Task.java:575) [flink-dist_2.11-1.14.3.jar:1.14.3]
	at java.lang.Thread.run(Thread.java:750) [?:1.8.0_322]