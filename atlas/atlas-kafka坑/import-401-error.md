
org.apache.atlas.AtlasServiceException: Metadata service API org.apache.atlas.AtlasClientV2$API_V2@31dadd46 failed with status 401 (Unauthorized) Response Body ()
at org.apache.atlas.AtlasBaseClient.callAPIWithResource(AtlasBaseClient.java:428)
at org.apache.atlas.AtlasBaseClient.callAPIWithResource(AtlasBaseClient.java:353)
at org.apache.atlas.AtlasBaseClient.callAPI(AtlasBaseClient.java:229)
at org.apache.atlas.AtlasClientV2.createEntity(AtlasClientV2.java:340)
at org.apache.atlas.kafka.bridge.KafkaBridge.createEntityInAtlas(KafkaBridge.java:278)
at org.apache.atlas.kafka.bridge.KafkaBridge.createOrUpdateTopic(KafkaBridge.java:212)
at org.apache.atlas.kafka.bridge.KafkaBridge.importTopic(KafkaBridge.java:196)
at org.apache.atlas.kafka.bridge.KafkaBridge.main(KafkaBridge.java:141)
Failed to import Kafka Data Model!!!

https://community.cloudera.com/t5/Support-Questions/Exception-in-Main-Thread-Atlas-Service-Exception/td-p/165887
Enter password for atlas :-
密码输入错误