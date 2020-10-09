
hive连接hbase外部表
https://my.oschina.net/houxm/blog/639748

1. 测试单节点hbase的连接

$ hive -hiveconf hbase.master=master:60000
进入hive的cli后，执行创建外部表的脚本，发现还是报错。

2. 测试集群hbase的连接

hive -hiveconf hbase.zookeeper.quorum=slave1,slave2,master,slave4,slave5,slave6,slave7
进入hive的cli后，执行创建外部表的脚本，发现创建成功。

由此可见，是hive读取hbase的zookeeper时出错了。查看hive-site.xml文件中，有个名为hive.zookeeper.quorum的property，复制一份改为hbase.zookeeper.quorum的属性。如下：

  <property>
    <name>hbase.zookeeper.quorum</name>
    <value>slave1,slave2,master,slave4,slave5,slave6,slave7</value>
    <description>
    </description>
  </property>
至此，问题解决，创建hbase外部表成功。