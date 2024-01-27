ERROR - [main:] ~ ImportKafkaEntities failed (KafkaBridge:151)
org.I0Itec.zkclient.exception.ZkTimeoutException: Unable to connect to zookeeper server 'dm-host118:2181,dm-host214:2181,dm-host211:2181' with timeout of 200 ms
at org.I0Itec.zkclient.ZkClient.connect(ZkClient.java:1233)
at org.I0Itec.zkclient.ZkClient.<init>(ZkClient.java:157)
at org.I0Itec.zkclient.ZkClient.<init>(ZkClient.java:131)
at org.I0Itec.zkclient.ZkClient.<init>(ZkClient.java:98)
at org.apache.atlas.kafka.bridge.KafkaBridge.<init>(KafkaBridge.java:165)
at org.apache.atlas.kafka.bridge.KafkaBridge.main(KafkaBridge.java:121)

vim atlas-application.properties
atlas.kafka.zookeeper.connection.timeout.ms=2000