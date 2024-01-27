
java.util.concurrent.CompletionException: org.apache.flink.util.FlinkRuntimeException: Could not recover job with job id 274d9568a48df0ecd73e1baacf3802b8.
at java.util.concurrent.CompletableFuture.encodeThrowable(CompletableFuture.java:273) ~[?:1.8.0_322]
at java.util.concurrent.CompletableFuture.completeThrowable(CompletableFuture.java:280) [?:1.8.0_322]
at java.util.concurrent.CompletableFuture$AsyncSupply.run(CompletableFuture.java:1606) [?:1.8.0_322]
at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149) [?:1.8.0_322]
at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624) [?:1.8.0_322]
at java.lang.Thread.run(Thread.java:750) [?:1.8.0_322]
Caused by: org.apache.flink.util.FlinkRuntimeException: Could not recover job with job id 274d9568a48df0ecd73e1baacf3802b8.
at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJob(SessionDispatcherLeaderProcess.java:144) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJobs(SessionDispatcherLeaderProcess.java:122) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
at org.apache.flink.runtime.dispatcher.runner.AbstractDispatcherLeaderProcess.supplyUnsynchronizedIfRunning(AbstractDispatcherLeaderProcess.java:198) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJobsIfRunning(SessionDispatcherLeaderProcess.java:113) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
at java.util.concurrent.CompletableFuture$AsyncSupply.run(CompletableFuture.java:1604) ~[?:1.8.0_322]
... 3 more
Caused by: org.apache.flink.util.FlinkException: Could not retrieve submitted JobGraph from state handle under /274d9568a48df0ecd73e1baacf3802b8. This indicates that the retrieved state handle is broken. Try cleaning the state handle store.
at org.apache.flink.runtime.jobmanager.DefaultJobGraphStore.recoverJobGraph(DefaultJobGraphStore.java:171) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJob(SessionDispatcherLeaderProcess.java:141) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJobs(SessionDispatcherLeaderProcess.java:122) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
at org.apache.flink.runtime.dispatcher.runner.AbstractDispatcherLeaderProcess.supplyUnsynchronizedIfRunning(AbstractDispatcherLeaderProcess.java:198) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJobsIfRunning(SessionDispatcherLeaderProcess.java:113) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
at java.util.concurrent.CompletableFuture$AsyncSupply.run(CompletableFuture.java:1604) ~[?:1.8.0_322]
... 3 more
Caused by: java.io.FileNotFoundException: File does not exist: /flink/ha/cluster_flink/submittedJobGraph71b9638a22e3
at org.apache.hadoop.hdfs.server.namenode.INodeFile.valueOf(INodeFile.java:85)
at org.apache.hadoop.hdfs.server.namenode.INodeFile.valueOf(INodeFile.java:75)
at org.apache.hadoop.hdfs.server.namenode.FSDirStatAndListingOp.getBlockLocations(FSDirStatAndListingOp.java:152)
at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.getBlockLocations(FSNamesystem.java:1909)
at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.getBlockLocations(NameNodeRpcServer.java:735)
at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.getBlockLocations(ClientNamenodeProtocolServerSideTranslatorPB.java:415)
at org.apache.hadoop.hdfs.protocol.proto.ClientNamenodeProtocolProtos$ClientNamenodeProtocol$2.callBlockingMethod(ClientNamenodeProtocolProtos.java)
at org.apache.hadoop.ipc.ProtobufRpcEngine$Server$ProtoBufRpcInvoker.call(ProtobufRpcEngine.java:523)
at org.apache.hadoop.ipc.RPC$Server.call(RPC.java:991)
at org.apache.hadoop.ipc.Server$RpcCall.run(Server.java:869)
at org.apache.hadoop.ipc.Server$RpcCall.run(Server.java:815)
at java.security.AccessController.doPrivileged(Native Method)
at javax.security.auth.Subject.doAs(Subject.java:422)
at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1875)
at org.apache.hadoop.ipc.Server$Handler.run(Server.java:2675)

	at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method) ~[?:1.8.0_322]
	at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62) ~[?:1.8.0_322]
	at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45) ~[?:1.8.0_322]
	at java.lang.reflect.Constructor.newInstance(Constructor.java:423) ~[?:1.8.0_322]
	at org.apache.hadoop.ipc.RemoteException.instantiateException(RemoteException.java:121) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.ipc.RemoteException.unwrapRemoteException(RemoteException.java:88) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DFSClient.callGetBlockLocations(DFSClient.java:861) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DFSClient.getLocatedBlocks(DFSClient.java:848) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DFSClient.getLocatedBlocks(DFSClient.java:837) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DFSClient.open(DFSClient.java:1005) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DistributedFileSystem$4.doCall(DistributedFileSystem.java:317) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DistributedFileSystem$4.doCall(DistributedFileSystem.java:313) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DistributedFileSystem.open(DistributedFileSystem.java:325) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.fs.FileSystem.open(FileSystem.java:898) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.flink.runtime.fs.hdfs.HadoopFileSystem.open(HadoopFileSystem.java:131) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.fs.hdfs.HadoopFileSystem.open(HadoopFileSystem.java:37) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.state.filesystem.FileStateHandle.openInputStream(FileStateHandle.java:68) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.state.RetrievableStreamStateHandle.openInputStream(RetrievableStreamStateHandle.java:66) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.state.RetrievableStreamStateHandle.retrieveState(RetrievableStreamStateHandle.java:58) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.jobmanager.DefaultJobGraphStore.recoverJobGraph(DefaultJobGraphStore.java:162) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJob(SessionDispatcherLeaderProcess.java:141) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJobs(SessionDispatcherLeaderProcess.java:122) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.dispatcher.runner.AbstractDispatcherLeaderProcess.supplyUnsynchronizedIfRunning(AbstractDispatcherLeaderProcess.java:198) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJobsIfRunning(SessionDispatcherLeaderProcess.java:113) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at java.util.concurrent.CompletableFuture$AsyncSupply.run(CompletableFuture.java:1604) ~[?:1.8.0_322]
	... 3 more
Caused by: org.apache.hadoop.ipc.RemoteException: File does not exist: /flink/ha/cluster_flink/submittedJobGraph71b9638a22e3
at org.apache.hadoop.hdfs.server.namenode.INodeFile.valueOf(INodeFile.java:85)
at org.apache.hadoop.hdfs.server.namenode.INodeFile.valueOf(INodeFile.java:75)
at org.apache.hadoop.hdfs.server.namenode.FSDirStatAndListingOp.getBlockLocations(FSDirStatAndListingOp.java:152)
at org.apache.hadoop.hdfs.server.namenode.FSNamesystem.getBlockLocations(FSNamesystem.java:1909)
at org.apache.hadoop.hdfs.server.namenode.NameNodeRpcServer.getBlockLocations(NameNodeRpcServer.java:735)
at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolServerSideTranslatorPB.getBlockLocations(ClientNamenodeProtocolServerSideTranslatorPB.java:415)
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
	at com.sun.proxy.$Proxy26.getBlockLocations(Unknown Source) ~[?:?]
	at org.apache.hadoop.hdfs.protocolPB.ClientNamenodeProtocolTranslatorPB.getBlockLocations(ClientNamenodeProtocolTranslatorPB.java:304) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method) ~[?:1.8.0_322]
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62) ~[?:1.8.0_322]
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43) ~[?:1.8.0_322]
	at java.lang.reflect.Method.invoke(Method.java:498) ~[?:1.8.0_322]
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invokeMethod(RetryInvocationHandler.java:422) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.io.retry.RetryInvocationHandler$Call.invokeMethod(RetryInvocationHandler.java:165) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.io.retry.RetryInvocationHandler$Call.invoke(RetryInvocationHandler.java:157) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.io.retry.RetryInvocationHandler$Call.invokeOnce(RetryInvocationHandler.java:95) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.io.retry.RetryInvocationHandler.invoke(RetryInvocationHandler.java:359) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at com.sun.proxy.$Proxy27.getBlockLocations(Unknown Source) ~[?:?]
	at org.apache.hadoop.hdfs.DFSClient.callGetBlockLocations(DFSClient.java:859) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DFSClient.getLocatedBlocks(DFSClient.java:848) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DFSClient.getLocatedBlocks(DFSClient.java:837) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DFSClient.open(DFSClient.java:1005) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DistributedFileSystem$4.doCall(DistributedFileSystem.java:317) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DistributedFileSystem$4.doCall(DistributedFileSystem.java:313) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.fs.FileSystemLinkResolver.resolve(FileSystemLinkResolver.java:81) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.hdfs.DistributedFileSystem.open(DistributedFileSystem.java:325) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.hadoop.fs.FileSystem.open(FileSystem.java:898) ~[flink-shaded-hadoop-2-uber-3.0.0-cdh6.3.0-7.0.jar:3.0.0-cdh6.3.0-7.0]
	at org.apache.flink.runtime.fs.hdfs.HadoopFileSystem.open(HadoopFileSystem.java:131) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.fs.hdfs.HadoopFileSystem.open(HadoopFileSystem.java:37) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.state.filesystem.FileStateHandle.openInputStream(FileStateHandle.java:68) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.state.RetrievableStreamStateHandle.openInputStream(RetrievableStreamStateHandle.java:66) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.state.RetrievableStreamStateHandle.retrieveState(RetrievableStreamStateHandle.java:58) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.jobmanager.DefaultJobGraphStore.recoverJobGraph(DefaultJobGraphStore.java:162) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJob(SessionDispatcherLeaderProcess.java:141) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJobs(SessionDispatcherLeaderProcess.java:122) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.dispatcher.runner.AbstractDispatcherLeaderProcess.supplyUnsynchronizedIfRunning(AbstractDispatcherLeaderProcess.java:198) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.dispatcher.runner.SessionDispatcherLeaderProcess.recoverJobsIfRunning(SessionDispatcherLeaderProcess.java:113) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at java.util.concurrent.CompletableFuture$AsyncSupply.run(CompletableFuture.java:1604) ~[?:1.8.0_322]




主要原因是在Hadoop Yarn环境部署了Flink HA Standalone集群
delete the znodes associated to your job:
deleteall /flink/cluster_flink/running_job_registry/274d9568a48df0ecd73e1baacf3802b8
deleteall /flink/cluster_flink/jobgraphs/274d9568a48df0ecd73e1baacf3802b8
deleteall /flink/cluster_flink/jobs/274d9568a48df0ecd73e1baacf3802b8



https://lists.apache.org/thread/s2sqv0tg0qyn6os802pqtb34x17f98pn
Without more information about your setup, I would assume you are trying to return JobManager (and HA setup) into a stable state. A couple of questions:

* Since your job is cancelled, I would assume that the current job’s HA state is not important, so we can delete the checkpoint pointer and data.
* Are there other jobs running on the same cluster whose HA state you want to salvage?

I can think of the following options:

1. If there are no other jobs running on the same cluster, and the HA state is not important, the easiest way is to totally replace your Zookeeper instances. (this will start the JobManager afresh, but will cause the HA state for all other jobs running on the same cluster to be lost)
2. Manually clear the Zookeeper HA state for the problematic job. This will keep the HA state of other jobs running on the same cluster.

To perform step 2, see below:
The zookeeper stores “Active” jobs in a znode hierarchy as shown below (You can imagine this like a pseudo file system). I am assuming the jobid you have pasted in logs.


* /flink/default/running_job_registry/3a97d1d50f663027ae81efe0f0aaaaaa
  This has the status of the job (e.g. RUNNING)

* /flink/default/leader/resource_manager_lock
  This has the information about which JM has the ResourceManager (which is the component responsible for registering the task slots in the cluster

There are other znodes as well, which are all interesting (e.g. /flink/default/checkpoints, /flink/default/checkpoint-counter), but I’ve highlighted the relevant ones.

To clear this, you can simply log unto your zookeeper nodes, and delete the znodes. The JobManager will repopulate them when the job starts up.

1. Log unto your zookeeper nodes (e.g. execute into your zookeeper container)
2. Execute the zookeeper CLI. This usually comes prepackaged with zookeeper, and you can simply run the pre-packaged script bin/zkCli.sh.

Explore the pseudo-file system by doing ls or get (e.g. ls /flink/default )

3. You can delete the znodes associated to your job

rmr /flink/default/running_job_registry/3a97d1d50f663027ae81efe0f0aaaaaa
rmr /flink/default/jobgraphs/3a97d1d50f663027ae81efe0f0aaaaaa
rmr /flink/default/checkpoints/3a97d1d50f663027ae81efe0f0aaaaaa
rmr /flink/default/checkpoint-counter/3a97d1d50f663027ae81efe0f0aaaaaa
rmr /flink/default/leaderlatch/3a97d1d50f663027ae81efe0f0aaaaaa
rmr /flink/default/leader/3a97d1d50f663027ae81efe0f0aaaaaa

This should result in your JobManager recovering from the faulty job.