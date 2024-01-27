
/data/opt/flink-1.14.3/bin/flink run  \
-Djobmanager.memory.process.size=1048m \
-Dtaskmanager.memory.process.size=4096m \
-p 1 \
-c com.pscsoft.data_platform.streaming.dag.stream.KafkaSourceData \
./flink-common-java-1.14-1.0-SNAPSHOT.jar





/data/opt/flink-1.14.3/bin/flink run  \
-c com.pscsoft.data_platform.streaming.dag.stream.KafkaSourceData \
./flink-common-java-1.14-1.0-SNAPSHOT.jar