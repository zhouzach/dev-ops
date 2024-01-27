

https://www.w3cschool.cn/solr_doc/solr_doc-emn62fs5.htmlv

./bin/solr start -c -z localhost:2181 -p 9838 -force

./bin/solr stop -p 9838

./bin/solr create -c vertex_index -shards 1 -replicationFactor 1 -force
./bin/solr create -c edge_index -shards 1 -replicationFactor 1 -force
./bin/solr create -c fulltext_index -shards 1 -replicationFactor 1 -force


CDH:
https://blog.csdn.net/u010886217/article/details/90632907

solrctl instancedir --generate /data/app/solr/instance-conf
solrctl instancedir --create solr_instance /data/app/solr/instance-conf
solrctl instancedir --list

solrctl collection --create vertex_index -s 1 -c solr_instance -r 1 -m 2
solrctl collection --create edge_index -s 1 -c solr_instance -r 1 -m 2
solrctl collection --create fulltext_index -s 1 -c solr_instance -r 1 -m 2


#####################################################################################
cp -r /data/opt/apache-atlas-2.2.0/conf/solr /opt/cloudera/parcels/CDH/lib/solr/
cd /opt/cloudera/parcels/CDH/lib/solr/
mv solr atlas-solr
/opt/cloudera/parcels/CDH/lib/solr/bin/solr create -c  vertex_index -d /opt/cloudera/parcels/CDH/lib/solr/atlas-solr -shards 3 -replicationFactor 2 -force
/opt/cloudera/parcels/CDH/lib/solr/bin/solr create -c  edge_index -d /opt/cloudera/parcels/CDH/lib/solr/atlas-solr -shards 3 -replicationFactor 2 -force
/opt/cloudera/parcels/CDH/lib/solr/bin/solr create -c  fulltext_index -d /opt/cloudera/parcels/CDH/lib/solr/atlas-solr -shards 3 -replicationFactor 2 -force
