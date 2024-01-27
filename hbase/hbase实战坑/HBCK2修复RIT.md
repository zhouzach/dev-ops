
https://blog.csdn.net/alinyua/article/details/105548122
https://mp.weixin.qq.com/s/GVMWwB1WsKcdvZGfvX1lcA?spm=a2c4e.11153940.blogcont683107.11.49d762a815MegW


一.处理Procedures & Locks
在 Procedures & Locks 页面查找waiting状态的procedure，按顺序进行bypass。按顺序是因为有一些waiting的发生是
procedure存在依赖关系，将其bypass后后面的procedure会进入success状态。如果bypass返回false就使用bypass -r，
还是不行再使用bypass -or
hbase org.apache.hbase.HBCK2 bypass 70
hbase org.apache.hbase.HBCK2 bypass -r 70
hbase org.apache.hbase.HBCK2 bypass -or 70

cat pid.txt | xargs hbase org.apache.hbase.HBCK2 bypass -or
cat regions.txt | xargs hbase org.apache.hbase.HBCK2 assigns -o

如果bypass 失败：
1）停止hbase
2）删除zookeeper /hbase
3）启动hbase




二.处理RIT队列
参考HBCK2运维指南可以以txt格式拿到RIT队列的所有procedure的id，将其复制到任意文件（如pid.txt），再执行以下命令即可
cat pid.txt | xargs hbase org.apache.hbase.HBCK2 bypass -or 
然后再以txt格式拿到RIT队列的所有region的encodedName，将其复制到任意文件（如region.txt），再执行以下命令即可
cat region.txt | xargs hbase org.apache.hbase.HBCK2 assigns



三.assign各个表中offline的region
检查一下各个表中是否有region的StorefileSize为0，当然也可能是本身没有存储多少数据，要注意辨别。这种一般对其assigns就可以了。


hbase org.apache.hbase.HBCK2 addFsRegionsMissingInMeta hbase:meta
hbase org.apache.hbase.HBCK2 extraRegionsInMeta --fix ods:user_hbase2
hbase org.apache.hbase.HBCK2 reportMissingRegionsInMeta  ods:user_hbase2


hdfs dfs -ls /hbase/data/ods/user_hbase3 | awk '{print $8}' | awk -F '/' '{print $6}' > region.txt

hadoop fs -mv /hbase/data /backup/hbase/data
echo "deleteall /hbase" | zookeeper-client
hdfs dfs -mkdir /hbase
hadoop fs -mv /backup/data /hbase
sudo -u hdfs hadoop fs -chown hbase:hbase /hbase
start hbase
