
echo "deleteall /hbase" | zookeeper-client

quit


/opt/cloudera/parcels/CDH/lib/zookeeper/bin/zkCli.sh -server localhost:2181
/opt/cloudera/parcels/CDH/lib/zookeeper/bin/zkCli.sh -server dm-host118:2181,dm-host211:2181,dm-host214:2181

/opt/cloudera/parcels/CDH/lib/zookeeper/bin/zkCli.sh -server  192.168.100.118:2181,192.168.100.211:2181,192.168.100.214:2181