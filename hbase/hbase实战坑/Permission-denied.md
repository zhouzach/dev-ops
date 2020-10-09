
https://hacpai.com/article/1542262232782

以 hbase 用户身份执行该命令
sudo - hbase hbase hbck -repair
sudo -u hbase hbase hbck -repair


sudo -u hdfs hadoop fs -chown hbase:hbase /hbase


sudo -u hbase hbase hbck -fixVersionFile