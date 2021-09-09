
https://docs.cloudera.com/documentation/enterprise/6/6.2/topics/phoenix_installation.html
https://juejin.im/post/6867834462039146509


Cloudera Manager 添加 parcel
https://archive.cloudera.com/phoenix/6.2.0/parcels/

cd /opt/cloudera/csd
wget https://archive.cloudera.com/phoenix/6.2.0/csd/PHOENIX-1.0.jar



Validating the Phoenix Installation
https://docs.cloudera.com/documentation/enterprise/6/6.2/topics/phoenix_installation.html
phoenix-psql /opt/cloudera/parcels/PHOENIX/lib/phoenix/examples/WEB_STAT.sql \
/opt/cloudera/parcels/PHOENIX/lib/phoenix/examples/WEB_STAT.csv \
/opt/cloudera/parcels/PHOENIX/lib/phoenix/examples/WEB_STAT_QUERIES.sql

创建phoenix二级索引，需要将
/opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-server.jar
/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/phoenix-core-5.0.0-cdh6.2.0.jar
复制到目录
/opt/cloudera/parcels/CDH/lib/hbase/lib

cp /opt/cloudera/parcels/PHOENIX/lib/phoenix/phoenix-5.0.0-cdh6.2.0-server.jar /opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/phoenix-core-5.0.0-cdh6.2.0.jar \
/opt/cloudera/parcels/CDH/lib/hbase/lib
