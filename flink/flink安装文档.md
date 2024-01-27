

https://ci.apache.org/projects/flink/flink-docs-release-1.10/ops/deployment/hadoop.html

https://repo1.maven.org/maven2/org/apache/flink/flink-shaded-hadoop-2-uber/2.8.3-10.0/


export FLINK_HOME=/opt/flink-1.10.0
export HADOOP_CONF_DIR=/etc/hadoop/conf
export HADOOP_CLASSPATH=`hadoop classpath`




https://www.cnblogs.com/tonglin0325/p/12459205.html
https://www.cnblogs.com/quchunhui/p/12463455.html
https://ci.apache.org/projects/flink/flink-docs-release-1.10/ops/deployment/cluster_setup.html
https://ci.apache.org/projects/flink/flink-docs-release-1.10/ops/deployment/yarn_setup.html



cdh flink 配置：
taskmanager.numberOfTaskSlots   为物理cpu核数


https://cloud.tencent.com/developer/article/1400610

conf/flink-conf.yaml
jobmanager.rpc.address


conf/slaves


https://ci.apache.org/projects/flink/flink-docs-release-1.10/ops/jobmanager_high_availability.html
conf/masters

conf/flink-conf.yaml
high-availability: zookeeper
high-availability.zookeeper.quorum: cdh1:2181,cdh2:2181,cdh3:2181
high-availability.storageDir: hdfs:///flink/ha/
high-availability.zookeeper.path.root: /flink
yarn.application-attempts: 10



yarn-session.sh -n 3 -s 4 -jm 1024 -tm 4096 -d



