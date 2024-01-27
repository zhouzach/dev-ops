
Caused by: java.lang.RuntimeException: Could not serialize row '+I{metricItem=disk, metricValue=673, createdTime=1.656395270568E12, myresponse=true, id=2}'. Make sure that the schema matches the input.
at org.apache.flink.formats.json.JsonRowSerializationSchema.serialize(JsonRowSerializationSchema.java:165)
at org.apache.flink.formats.json.JsonRowSerializationSchema.serialize(JsonRowSerializationSchema.java:68)
at org.apache.flink.connector.kafka.sink.KafkaRecordSerializationSchemaBuilder$KafkaRecordSerializationSchemaWrapper.serialize(KafkaRecordSerializationSchemaBuilder.java:312)
at org.apache.flink.connector.kafka.sink.KafkaWriter.write(KafkaWriter.java:182)
at org.apache.flink.streaming.runtime.operators.sink.SinkOperator.processElement(SinkOperator.java:163)
at org.apache.flink.streaming.runtime.tasks.CopyingChainingOutput.pushToOperator(CopyingChainingOutput.java:82)
... 60 more
Caused by: java.lang.IllegalArgumentException: Accessing a field by position is not supported in name-based field mode.
at org.apache.flink.types.Row.getField(Row.java:257)
at org.apache.flink.formats.json.JsonRowSerializationSchema.lambda$assembleRowConverter$dd344700$1(JsonRowSerializationSchema.java:396)
at org.apache.flink.formats.json.JsonRowSerializationSchema.lambda$wrapIntoNullableConverter$1fa09b5b$1(JsonRowSerializationSchema.java:218)
at org.apache.flink.formats.json.JsonRowSerializationSchema.serialize(JsonRowSerializationSchema.java:162)



将DataStream<Row>通过定义Schema,转换成结构化的Table
final Schema tableSchema = Schema.newBuilder().fromFields(kafkaColumns, kafkaDataTypes2).build();
tEnv.createTemporaryView("mySink", dataStream, tableSchema);