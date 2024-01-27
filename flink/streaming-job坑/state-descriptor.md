2022-05-07 07:16:32,027 WARN  org.apache.flink.runtime.taskmanager.Task                    [] - Co-Process-Broadcast (1/2)#1 (9ab4d5ff292f4a9ad7970ae3b75c4e79) switched from RUNNING to FAILED with failure cause: java.lang.IllegalArgumentException: The requested state does not exist. Check for typos in your state descriptor, or specify the state descriptor in the datastream.broadcast(...) call if you forgot to register it.
at org.apache.flink.streaming.api.operators.co.CoBroadcastWithNonKeyedOperator$ReadWriteContextImpl.getBroadcastState(CoBroadcastWithNonKeyedOperator.java:168)
at com.dm.data_warehouse.streaming.AbnormalDetectionJoinRedis$PatternEvaluator.processBroadcastElement(AbnormalDetectionJoinRedis.java:169)
at com.dm.data_warehouse.streaming.AbnormalDetectionJoinRedis$PatternEvaluator.processBroadcastElement(AbnormalDetectionJoinRedis.java:121)
at org.apache.flink.streaming.api.operators.co.CoBroadcastWithNonKeyedOperator.processElement2(CoBroadcastWithNonKeyedOperator.java:118)




https://blog.csdn.net/Zsigner/article/details/122500920
dataStream.broadcast(MapStateDescriptor<?,?>)name 需要跟BroadcastProcessFunction中的Descriptor name保持一致