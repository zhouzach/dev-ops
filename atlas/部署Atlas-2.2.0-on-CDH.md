
https://www.modb.pro/db/196903

scp distro/target/apache-atlas-2.1.0-bin.tar.gz root@192.168.100.118:/data/opt

vim conf/atlas-env.sh
export HBASE_CONF_DIR=/etc/hbase/conf
export ATLAS_SERVER_HEAP="-Xms15360m -Xmx15360m -XX:MaxNewSize=5120m -XX:MetaspaceSize=100M -XX:MaxMetaspaceSize=512m"
export ATLAS_SERVER_OPTS="-server -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+CMSClassUnloadingEnabled -XX:+UseConcMarkSweepGC -XX:+CMSParallelRemarkEnabled -XX:+PrintTenuringDistribution -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=dumps/atlas_server.hprof -Xloggc:logs/gc-worker.log -verbose:gc -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=1m -XX:+PrintGCDetails -XX:+PrintHeapAtGC -XX:+PrintGCTimeStamps"

vim conf/atlas-application.properties
atlas.notification.embedded=false

集成CDH的HBASE
添加hbase集群配置文件到/opt/apache-atlas-2.1.0/conf/hbase下
ln -s /etc/hbase/conf/ /data/opt/apache-atlas-2.1.0/conf/hbase


集成CDH的SOLR
①将apache-atlas-2.2.0/conf/solr文件拷贝到solr的安装目录下，更名为atlas-solr
cp -r /data/opt/apache-atlas-2.2.0/conf/solr /opt/cloudera/parcels/CDH/lib/solr/
mv /opt/cloudera/parcels/CDH/lib/solr/solr /opt/cloudera/parcels/CDH/lib/solr/atlas-solr
scp -r /opt/cloudera/parcels/CDH/lib/solr/atlas-solr wh2:/opt/cloudera/parcels/CDH/lib/solr/atlas-solr
scp -r /opt/cloudera/parcels/CDH/lib/solr/atlas-solr wh3:/opt/cloudera/parcels/CDH/lib/solr/atlas-solr

②创建collection
/opt/cloudera/parcels/CDH/lib/solr/bin/solr create -c  vertex_index -d /opt/cloudera/parcels/CDH/lib/solr/atlas-solr -shards 3 -replicationFactor 2 -force
/opt/cloudera/parcels/CDH/lib/solr/bin/solr create -c  edge_index -d /opt/cloudera/parcels/CDH/lib/solr/atlas-solr -shards 3 -replicationFactor 2 -force
/opt/cloudera/parcels/CDH/lib/solr/bin/solr create -c  fulltext_index -d /opt/cloudera/parcels/CDH/lib/solr/atlas-solr -shards 3 -replicationFactor 2 -force

集成CDH的KAFKA
①创建Kafka Topic
kafka-topics --bootstrap-server dm-host118:9092,dm-host214:9092,dm-host211:9092 --create --replication-factor 3 --partitions 3 --topic _HOATLASOK
kafka-topics --bootstrap-server dm-host118:9092,dm-host214:9092,dm-host211:9092 --create --replication-factor 3 --partitions 3 --topic ATLAS_ENTITIES
kafka-topics --bootstrap-server dm-host118:9092,dm-host214:9092,dm-host211:9092 --create --replication-factor 3 --partitions 3 --topic ATLAS_HOOK
②查看topic
kafka-topics --bootstrap-server dm-host118:9092,dm-host214:9092,dm-host211:9092 --list
kafka-console-consumer --bootstrap-server dm-host118:9092,dm-host214:9092,dm-host211:9092 --topic _HOATLASOK --from-beginning
kafka-topics --bootstrap-server dm-host118:9092,dm-host214:9092,dm-host211:9092 --delete --topic ATLAS_HOOK



cd /data/opt/apache-atlas-2.2.0
./bin/atlas_start.py

http://www.nora.press/2020/04/16/Atlas2.0.0%E9%83%A8%E7%BD%B2/

