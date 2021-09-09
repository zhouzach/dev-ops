
https://www.alluxio.io/download/releases/
https://docs.alluxio.io/os/user/stable/en/deploy/Running-Alluxio-On-a-HA-Cluster.html
https://docs.alluxio.io/os/user/stable/en/operation/Journal.html#configuring-ufs-journal
https://docs.alluxio.io/os/user/stable/en/reference/Properties-List.html

cp conf/alluxio-site.properties.template conf/alluxio-site.properties

vim conf/alluxio-site.properties
# Security properties
alluxio.master.security.impersonation.root.users=*

# Worker properties
alluxio.worker.tieredstore.level0.dirs.quota=10GB

# HA
alluxio.zookeeper.enabled=true
alluxio.zookeeper.address=qile-test-cdh001:2181,qile-test-cdh002:2181,qile-test-cdh003:2181
alluxio.master.journal.type=UFS
alluxio.master.journal.folder=/mnt/ramdisk/alluxio


二、
Please make sure your HDFS configuration file core-site.xml (in your default hadoop installation or spark/conf/ if you customize this file for Spark) has the following property:

<configuration>
  <property>
    <name>fs.alluxio.impl</name>
    <value>alluxio.hadoop.FileSystem</value>
  </property>
</configuration>

vim /etc/profile
export HADOOP_CLASSPATH=`hadoop classpath`:/opt/alluxio-2.4.1-1/client/alluxio-2.4.1-1-client.jar

For Spark applications, set in spark/conf/spark-defaults.conf on every node running Spark and restart the long-running Spark server processes:

spark.driver.extraClassPath /opt/alluxio-2.4.1-1/client/alluxio-2.4.1-1-client.jar
spark.executor.extraClassPath /opt/alluxio-2.4.1-1/client/alluxio-2.4.1-1-client.jar
For Hive, set environment variable HIVE_AUX_JARS_PATH in conf/hive-env.sh:

HIVE_AUX_JARS_PATH=/<PATH_TO_ALLUXIO>/client/alluxio-1.8.1-client.jar:${HIVE_AUX_JARS_PATH}
In some cases, one compute framework relies on another. For example, a Hive service can use MapReduce as the engine for distributed query. In this case it is necessary to set classpath for both Hive and MapReduce to be configured correctly.




在所有节点创建/mnt/ramdisk/alluxioworker
mkdir -p /mnt/ramdisk/alluxioworker



Inbound TCP 19999 - The Alluxio master’s default web UI port: http://<master-hostname>:19999