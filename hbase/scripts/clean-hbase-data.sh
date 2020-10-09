
hdfs dfs -rm -r /hbase/
echo "deleteall /hbase" | zookeeper-client
hdfs dfs -mkdir /hbase
sudo -u hdfs hadoop fs -chown hbase:hbase /hbase