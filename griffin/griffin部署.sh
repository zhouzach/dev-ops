
https://griffin.apache.org/docs/quickstart-cn.html

1.
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '123456';
flush privileges;
CREATE DATABASE IF NOT EXISTS griffin_quartz DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
mysql -uroot -p123456 -Dgriffin_quartz < Init_quartz_mysql_innodb.sql

2.
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.322.b06-1.el7_9.x86_64
export HADOOP_CONF_DIR=/etc/hadoop/conf

export SPARK_HOME=/opt/cloudera/parcels/CDH/lib/spark
export LIVY_HOME=/data/opt/apache-livy-0.7.1-incubating-bin

3.
cp livy.conf.template livy.conf
vim livy.conf
livy.server.host = 192.168.100.211
livy.spark.master = yarn
livy.spark.deployMode = cluster
livy.repl.enable-hive-context = true

./bin/livy-server start

4.
elasticsearch-6.2.4
curl -XPUT "192.168.100.16:9200/griffin?pretty" -H 'Content-Type: application/json' -d '
{
    "aliases": {},
    "mappings": {
        "accuracy": {
            "properties": {
                "name": {
                    "fields": {
                        "keyword": {
                            "ignore_above": 256,
                            "type": "keyword"
                        }
                    },
                    "type": "text"
                },
                "tmst": {
                    "type": "date"
                }
            }
        }
    },
    "settings": {
        "index": {
            "number_of_replicas": "0",
            "number_of_shards": "1"
        }
    }
}
'

5.
service/src/main/resources/application.properties
service/src/main/resources/quartz.properties
service/src/main/resources/sparkProperties.json
service/src/main/resources/env/env_batch.json
配置文件修改好后,执行如下maven命令进行编译打包
mvn -Dmaven.test.skip=true clean install

#scp target/service-0.6.0.jar root@192.168.100.118:/data/app/griffin/service/
scp service/target/service-0.6.0.jar root@192.168.100.118:/data/app/griffin/service/
scp measure/target/measure-0.6.0.jar root@192.168.100.118:/data/app/griffin/measure/

hadoop fs -mkdir -p /griffin/jars/
hadoop fs -put /data/app/griffin/measure/measure-0.6.0.jar /griffin/jars/

hadoop fs -mkdir -p /griffin/spark-conf/
hadoop fs -put /etc/hive/conf/hive-site.xml /griffin/spark-conf/

6.
https://blog.csdn.net/weixin_43160819/article/details/118298681
CREATE TABLE `DATACONNECTOR` (
  `ID` bigint(20) NOT NULL,
  `CONFIG` varchar(1024) DEFAULT NULL,
  `CREATEDDATE` bigint(20) DEFAULT NULL,
  `DATAFRAMENAME` varchar(1024) DEFAULT NULL,
  `DATATIMEZONE` varchar(1024) DEFAULT NULL,
  `DATAUNIT` varchar(1024) DEFAULT NULL,
  `MODIFIEDDATE` bigint(20) DEFAULT NULL,
  `NAME` varchar(1024) DEFAULT NULL,
	`TYPE` varchar(255) DEFAULT NULL,
	`VERSION` varchar(255) DEFAULT NULL
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


7.
运行service-0.4.0.jar,启动Griffin管理后台
nohup java -jar service-0.4.0.jar>service.out 2>&1 &

几秒钟后,我们可以访问Apache Griffin的默认UI(默认情况下,spring boot的端口是8080)
http://192.168.100.118:8080

8.
Create measure and Create Job
https://github.com/apache/griffin/blob/master/griffin-doc/ui/user-guide.md
