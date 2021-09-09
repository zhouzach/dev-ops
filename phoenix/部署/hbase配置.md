
https://docs.cloudera.com/documentation/enterprise/6/6.2/topics/phoenix_spark_connector.html

hbase-site.xml 的 HBase 服务高级配置代码段（安全阀）
hbase.regionserver.wal.codec
org.apache.hadoop.hbase.regionserver.wal.IndexedWALEditCodec

phoenix.functions.allowUserDefinedFunctions
true

phoenix.schema.isNamespaceMappingEnabled
true

phoenix.schema.mapSystemTablesToNamespace
true


hbase-site.xml 的 HBase 客户端高级配置代码段（安全阀）
phoenix.schema.isNamespaceMappingEnabled
true

phoenix.schema.mapSystemTablesToNamespace
true

hbase.regionserver.wal.codec
org.apache.hadoop.hbase.regionserver.wal.IndexedWALEditCodec

phoenix.functions.allowUserDefinedFunctions
true

phoenix.default.column.encoded.bytes.attrib
0

