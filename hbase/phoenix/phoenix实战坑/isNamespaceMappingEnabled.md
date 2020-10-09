
Error: ERROR 726 (43M10):  Inconsistent namespace mapping properties. Cannot initiate connection as SYSTEM:CATALOG is found but client does not have phoenix.schema.isNamespaceMappingEnabled enabled (state=43M10,code=726)

http://apache-phoenix-user-list.1124778.n5.nabble.com/client-does-not-have-phoenix-schema-isNamespaceMappingEnabled-td4962.html
HBASE_CONF_PATH=/etc/hbase/conf phoenix-sqlline cdh1,cdh2,cdh3:2181:/hbase

https://blog.csdn.net/Sword1996/article/details/100089270
cp /etc/hbase/conf/hbase-site.xml  /opt/cloudera/parcels/PHOENIX/bin

https://community.cloudera.com/t5/Support-Questions/Apache-Phoenix-isNamespaceMappingEnabled-error-command-line/td-p/201767