
Apache Atlas: HTTP ERROR 503 Service Unavailable:
2022-03-31 15:28:34,505 ERROR - [Curator-Framework-0:] ~ Background operation retry gave up (CuratorFrameworkImpl:694)
org.apache.zookeeper.KeeperException$ConnectionLossException: KeeperErrorCode = ConnectionLoss
at org.apache.zookeeper.KeeperException.create(KeeperException.java:102)
at org.apache.curator.framework.imps.CuratorFrameworkImpl.checkBackgroundRetry(CuratorFrameworkImpl.java:862)
at org.apache.curator.framework.imps.CuratorFrameworkImpl.performBackgroundOperation(CuratorFrameworkImpl.java:990)
at org.apache.curator.framework.imps.CuratorFrameworkImpl.backgroundOperationsLoop(CuratorFrameworkImpl.java:943)
at org.apache.curator.framework.imps.CuratorFrameworkImpl.access$300(CuratorFrameworkImpl.java:66)
at org.apache.curator.framework.imps.CuratorFrameworkImpl$4.call(CuratorFrameworkImpl.java:346)
at java.util.concurrent.FutureTask.run(FutureTask.java:266)
at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.access$201(ScheduledThreadPoolExecutor.java:180)
at java.util.concurrent.ScheduledThreadPoolExecutor$ScheduledFutureTask.run(ScheduledThreadPoolExecutor.java:293)
at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
at java.lang.Thread.run(Thread.java:750)



vim apache-atlas-2.2.0-embedded-hbase-solr/conf/atlas-application.properties
atlas.notification.embedded=false

https://stackoverflow.com/questions/66614260/apache-atlas-http-error-503-service-unavailable