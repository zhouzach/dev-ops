
hbash shell 创建表时：
1.ERROR: org.apache.hadoop.hbase.PleaseHoldException: Master is initializing

程序向hbase写入数据时：
java.net.SocketTimeoutException: callTimeout=60000, callDuration=69190: org.apache.hadoop.hbase.NotServingRegionException: hbase:meta,,1 is not online on qile-test-cdh003,16020,1592199545000




https://stackoverflow.com/questions/30223435/notservingregionexception-region-hbasemeta

Try to delete /hbase in zookeeper, while doing the same make sure HBase Cluster is down:

echo "deleteall /hbase" | zookeeper-client
Then try to start HBase


2.
org.apache.hadoop.hbase.client.RpcRetryingCallerImpl - Call exception, tries=7, retries=8, started=8196 ms ago, cancelled=false, msg=org.apache.hadoop.hbase.PleaseHoldException: Master is initializing
