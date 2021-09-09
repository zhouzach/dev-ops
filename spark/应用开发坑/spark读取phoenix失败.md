spark read phoenix table ERROR 726 (43M10): Inconsistent namespace mapping properties. Cannot initiate connection as SYSTEM:CATALOG is found but client does not have phoenix.schema.isNamespaceMappingEnabled enabled

https://community.cloudera.com/t5/Support-Questions/phoenix-from-spark/td-p/183082
putting the correct "hbase-site.xml" in spark conf directory: /etc/spark/conf/hbase-site.xml