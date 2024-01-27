
solr.version=7.4.0
mvn clean -DskipTests package -Pdist
scp ./distro/target/apache-atlas-2.2.0-server.tar.gz root@192.168.100.118:/data/opt
tar -zxvf apache-atlas-2.2.0-server.tar.gz

vim conf/atlas-application.properties
atlas.graph.storage.hostname=dm-host118,dm-host214,dm-host211
atlas.graph.index.search.solr.zookeeper-url=dm-host118:2181,dm-host214:2181,dm-host211:2181
atlas.notification.embedded=false

vim conf/atlas-env.sh
export HBASE_CONF_DIR=/etc/hbase/conf



curl -u admin:admin http://localhost:21000/api/atlas/admin/version