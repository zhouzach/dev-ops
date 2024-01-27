



2022-04-29 14:40:04,101 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ZooKeeper [] - Client environment:java.library.path=/usr/java/packages/lib/amd64:/usr/lib64:/lib64:/lib:/usr/lib
2022-04-29 14:40:04,101 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ZooKeeper [] - Client environment:java.io.tmpdir=/tmp
2022-04-29 14:40:04,102 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ZooKeeper [] - Client environment:java.compiler=<NA>
2022-04-29 14:40:04,102 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ZooKeeper [] - Client environment:os.name=Linux
2022-04-29 14:40:04,103 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ZooKeeper [] - Client environment:os.arch=amd64
2022-04-29 14:40:04,103 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ZooKeeper [] - Client environment:os.version=3.10.0-1127.el7.x86_64
2022-04-29 14:40:04,104 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ZooKeeper [] - Client environment:user.name=root
2022-04-29 14:40:04,104 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ZooKeeper [] - Client environment:user.home=/root
2022-04-29 14:40:04,105 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ZooKeeper [] - Client environment:user.dir=/root
2022-04-29 14:40:04,114 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ZooKeeper [] - Initiating client connection, connectString=dm-host118:2181,dm-host211:2181,dm-host214:2181 sessionTimeout=60000 watcher=org.apache.flink.shaded.curator4.org.apache.curator.ConnectionState@5633ed82
2022-04-29 14:40:04,282 WARN  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ClientCnxn [] - SASL configuration failed: javax.security.auth.login.LoginException: No JAAS configuration section named 'Client' was found in specified JAAS configuration file: '/tmp/jaas-7805751914357828228.conf'. Will continue connection to Zookeeper server without SASL authentication, if Zookeeper server allows it.
2022-04-29 14:40:04,291 INFO  org.apache.flink.shaded.curator4.org.apache.curator.framework.imps.CuratorFrameworkImpl [] - Default schema
2022-04-29 14:40:04,296 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ClientCnxn [] - Opening socket connection to server dm-host211/192.168.100.211:2181
2022-04-29 14:40:04,301 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ClientCnxn [] - Socket connection established to dm-host211/192.168.100.211:2181, initiating session
2022-04-29 14:40:04,304 ERROR org.apache.flink.shaded.curator4.org.apache.curator.ConnectionState [] - Authentication failed
2022-04-29 14:40:04,346 INFO  org.apache.flink.runtime.blob.BlobServer                     [] - Created BLOB server storage directory /tmp/blobStore-2b7f3d16-9279-4968-bc52-38d48e052a78
2022-04-29 14:40:04,353 INFO  org.apache.flink.shaded.zookeeper3.org.apache.zookeeper.ClientCnxn [] - Session establishment complete on server dm-host211/192.168.100.211:2181, sessionid = 0xff801ad3e600a6c0, negotiated timeout = 60000
2022-04-29 14:40:04,374 INFO  org.apache.flink.shaded.curator4.org.apache.curator.framework.state.ConnectionStateManager [] - State change: CONNECTED
2022-04-29 14:40:04,382 INFO  org.apache.flink.runtime.blob.BlobServer                     [] - Started BLOB server at 0.0.0.0:34111 - max concurrent requests: 50 - max backlog: 1000
2022-04-29 14:40:04,485 INFO  org.apache.flink.runtime.metrics.MetricRegistryImpl          [] - No metrics reporter configured, no metrics will be exposed/reported.
2022-04-29 14:40:04,522 INFO  org.apache.flink.runtime.rpc.akka.AkkaRpcServiceUtils        [] - Trying to start actor system, external address dm-host211:0, bind address 0.0.0.0:0.
2022-04-29 14:40:04,762 INFO  akka.event.slf4j.Slf4jLogger                                 [] - Slf4jLogger started
2022-04-29 14:40:04,812 INFO  akka.remote.RemoteActorRefProvider                           [] - Akka Cluster not in use - enabling unsafe features anyway because `akka.remote.use-unsafe-remote-features-outside-cluster` has been enabled.
2022-04-29 14:40:04,815 INFO  akka.remote.Remoting                                         [] - Starting remoting
2022-04-29 14:40:04,965 INFO  akka.remote.Remoting                                         [] - Remoting started; listening on addresses :[akka.tcp://flink-metrics@dm-host211:33146]
2022-04-29 14:40:05,119 INFO  org.apache.flink.runtime.rpc.akka.AkkaRpcServiceUtils        [] - Actor system started at akka.tcp://flink-metrics@dm-host211:33146
2022-04-29 14:40:05,299 INFO  org.apache.flink.runtime.rpc.akka.AkkaRpcService             [] - Starting RPC endpoint for org.apache.flink.runtime.metrics.dump.MetricQueryService at akka://flink-metrics/user/rpc/MetricQueryService .
2022-04-29 14:40:05,537 INFO  org.apache.flink.runtime.dispatcher.FileExecutionGraphInfoStore [] - Initializing FileExecutionGraphInfoStore: Storage directory /tmp/executionGraphStore-8e860c39-3ff5-4e4a-ab3b-4910a73b7a20, expiration time 3600000, maximum cache size 52428800 bytes.
2022-04-29 14:40:06,063 INFO  org.apache.flink.configuration.Configuration                 [] - Config uses fallback configuration key 'rest.port' instead of key 'rest.bind-port'
2022-04-29 14:40:06,069 INFO  org.apache.flink.runtime.dispatcher.DispatcherRestEndpoint   [] - Upload directory /tmp/flink-web-c4b385a4-a525-4b5e-a62a-0106a7a0bcd9/flink-web-upload does not exist.
2022-04-29 14:40:06,075 INFO  org.apache.flink.runtime.dispatcher.DispatcherRestEndpoint   [] - Created directory /tmp/flink-web-c4b385a4-a525-4b5e-a62a-0106a7a0bcd9/flink-web-upload for file uploads.
2022-04-29 14:40:06,109 INFO  org.apache.flink.runtime.dispatcher.DispatcherRestEndpoint   [] - Starting rest endpoint.
2022-04-29 14:40:08,992 INFO  org.apache.flink.runtime.webmonitor.WebMonitorUtils          [] - Determined location of main cluster component log file: /data/opt/flink-1.14.3/log/flink-root-standalonesession-0-dm-host211.log
2022-04-29 14:40:08,996 INFO  org.apache.flink.runtime.webmonitor.WebMonitorUtils          [] - Determined location of main cluster component stdout file: /data/opt/flink-1.14.3/log/flink-root-standalonesession-0-dm-host211.out
2022-04-29 14:40:10,703 INFO  org.apache.flink.runtime.dispatcher.DispatcherRestEndpoint   [] - Rest endpoint listening at dm-host214:8081
2022-04-29 14:40:11,112 INFO  org.apache.flink.runtime.leaderelection.DefaultLeaderElectionService [] - Starting DefaultLeaderElectionService with ZooKeeperLeaderElectionDriver{leaderLatchPath='/leader/rest_server/latch', connectionInformationPath='/leader/rest_server/connection_info'}.
2022-04-29 14:40:11,121 INFO  org.apache.flink.runtime.dispatcher.DispatcherRestEndpoint   [] - Web frontend listening at http://dm-host214:8081.
2022-04-29 14:40:11,429 INFO  org.apache.flink.runtime.leaderelection.DefaultLeaderElectionService [] - Starting DefaultLeaderElectionService with ZooKeeperLeaderElectionDriver{leaderLatchPath='/leader/dispatcher/latch', connectionInformationPath='/leader/dispatcher/connection_info'}.
2022-04-29 14:40:11,434 INFO  org.apache.flink.runtime.resourcemanager.ResourceManagerServiceImpl [] - Starting resource manager service.
2022-04-29 14:40:11,442 INFO  org.apache.flink.runtime.leaderelection.DefaultLeaderElectionService [] - Starting DefaultLeaderElectionService with ZooKeeperLeaderElectionDriver{leaderLatchPath='/leader/resource_manager/latch', connectionInformationPath='/leader/resource_manager/connection_info'}.
2022-04-29 14:40:11,468 INFO  org.apache.flink.runtime.leaderretrieval.DefaultLeaderRetrievalService [] - Starting DefaultLeaderRetrievalService with ZookeeperLeaderRetrievalDriver{connectionInformationPath='/leader/resource_manager/connection_info'}.
2022-04-29 14:40:11,471 INFO  org.apache.flink.runtime.leaderretrieval.DefaultLeaderRetrievalService [] - Starting DefaultLeaderRetrievalService with ZookeeperLeaderRetrievalDriver{connectionInformationPath='/leader/dispatcher/connection_info'}.
2022-04-29 14:40:22,068 ERROR org.apache.flink.runtime.rest.handler.job.JobsOverviewHandler [] - Unhandled exception.
org.apache.flink.runtime.rpc.akka.exceptions.AkkaRpcException: Failed to serialize the result for RPC call : requestMultipleJobDetails.
	at org.apache.flink.runtime.rpc.akka.AkkaRpcActor.serializeRemoteResultAndVerifySize(AkkaRpcActor.java:417) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at org.apache.flink.runtime.rpc.akka.AkkaRpcActor.lambda$sendAsyncResponse$2(AkkaRpcActor.java:373) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at java.util.concurrent.CompletableFuture.uniHandle(CompletableFuture.java:836) ~[?:1.8.0_322]
	at java.util.concurrent.CompletableFuture.uniHandleStage(CompletableFuture.java:848) ~[?:1.8.0_322]
	at java.util.concurrent.CompletableFuture.handle(CompletableFuture.java:2168) ~[?:1.8.0_322]
	at org.apache.flink.runtime.rpc.akka.AkkaRpcActor.sendAsyncResponse(AkkaRpcActor.java:365) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at org.apache.flink.runtime.rpc.akka.AkkaRpcActor.handleRpcInvocation(AkkaRpcActor.java:332) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at org.apache.flink.runtime.rpc.akka.AkkaRpcActor.handleRpcMessage(AkkaRpcActor.java:217) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at org.apache.flink.runtime.rpc.akka.FencedAkkaRpcActor.handleRpcMessage(FencedAkkaRpcActor.java:78) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at org.apache.flink.runtime.rpc.akka.AkkaRpcActor.handleMessage(AkkaRpcActor.java:163) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at akka.japi.pf.UnitCaseStatement.apply(CaseStatements.scala:24) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at akka.japi.pf.UnitCaseStatement.apply(CaseStatements.scala:20) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at scala.PartialFunction.applyOrElse(PartialFunction.scala:123) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at scala.PartialFunction.applyOrElse$(PartialFunction.scala:122) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at akka.japi.pf.UnitCaseStatement.applyOrElse(CaseStatements.scala:20) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at scala.PartialFunction$OrElse.applyOrElse(PartialFunction.scala:171) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at scala.PartialFunction$OrElse.applyOrElse(PartialFunction.scala:172) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at scala.PartialFunction$OrElse.applyOrElse(PartialFunction.scala:172) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at akka.actor.Actor.aroundReceive(Actor.scala:537) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at akka.actor.Actor.aroundReceive$(Actor.scala:535) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at akka.actor.AbstractActor.aroundReceive(AbstractActor.scala:220) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at akka.actor.ActorCell.receiveMessage(ActorCell.scala:580) [flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at akka.actor.ActorCell.invoke(ActorCell.scala:548) [flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at akka.dispatch.Mailbox.processMailbox(Mailbox.scala:270) [flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at akka.dispatch.Mailbox.run(Mailbox.scala:231) [flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at akka.dispatch.Mailbox.exec(Mailbox.scala:243) [flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at java.util.concurrent.ForkJoinTask.doExec(ForkJoinTask.java:289) [?:1.8.0_322]
	at java.util.concurrent.ForkJoinPool$WorkQueue.runTask(ForkJoinPool.java:1056) [?:1.8.0_322]
	at java.util.concurrent.ForkJoinPool.runWorker(ForkJoinPool.java:1692) [?:1.8.0_322]
	at java.util.concurrent.ForkJoinWorkerThread.run(ForkJoinWorkerThread.java:175) [?:1.8.0_322]
Caused by: java.io.NotSerializableException: java.util.HashMap$Values
	at java.io.ObjectOutputStream.writeObject0(ObjectOutputStream.java:1184) ~[?:1.8.0_322]
	at java.io.ObjectOutputStream.defaultWriteFields(ObjectOutputStream.java:1548) ~[?:1.8.0_322]
	at java.io.ObjectOutputStream.writeSerialData(ObjectOutputStream.java:1509) ~[?:1.8.0_322]
	at java.io.ObjectOutputStream.writeOrdinaryObject(ObjectOutputStream.java:1432) ~[?:1.8.0_322]
	at java.io.ObjectOutputStream.writeObject0(ObjectOutputStream.java:1178) ~[?:1.8.0_322]
	at java.io.ObjectOutputStream.writeObject(ObjectOutputStream.java:348) ~[?:1.8.0_322]
	at org.apache.flink.util.InstantiationUtil.serializeObject(InstantiationUtil.java:632) ~[flink-dist_2.11-1.14.3.jar:1.14.3]
	at org.apache.flink.runtime.rpc.akka.AkkaRpcSerializedValue.valueOf(AkkaRpcSerializedValue.java:66) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]
	at org.apache.flink.runtime.rpc.akka.AkkaRpcActor.serializeRemoteResultAndVerifySize(AkkaRpcActor.java:400) ~[flink-rpc-akka_3b9aa982-e80d-467b-afff-51540a4ff833.jar:1.14.3]