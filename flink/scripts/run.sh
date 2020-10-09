
/opt/flink-1.11.0/bin/flink run-application -t yarn-application \
-Djobmanager.memory.process.size=1048m \
-Dtaskmanager.memory.process.size=4096m \
-p 1 -ys 2 \
-ynm Sink-Hbase -d \
-c cn.dataflow.sql.FromKafkaSinkHbase \
./data-flow-1.0.jar