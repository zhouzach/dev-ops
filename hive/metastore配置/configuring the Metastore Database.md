
Unable to instantiate org.apache.hadoop.hive.ql.metadata.SessionHiveMetaStoreClient

## Configuring the Metastore Database
https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/cdh_ig_hive_metastore_configure.html#configure_metastore_db

#### 1.必须先切换到脚本目录，再登录mysql，这样source执行脚本的时候才不会出错
cd /opt/cloudera/parcels/CDH/lib/hive/scripts/metastore/upgrade/mysql/
mysql -u root -p123456
CREATE DATABASE metastore;
USE metastore;
SOURCE /opt/cloudera/parcels/CDH/lib/hive/scripts/metastore/upgrade/mysql/hive-schema-2.1.1.mysql.sql
CREATE USER 'hive'@'qile-test-cdh003' IDENTIFIED BY 'hive';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'hive'@'qile-test-cdh003';
GRANT ALL PRIVILEGES ON metastore.* TO 'hive'@'qile-test-cdh003';
FLUSH PRIVILEGES;

#### 2.Configure the metastore service to communicate with the MySQL database
### ************************************************************************
### ************************************************************************
This step shows the configuration properties you need to set in hive-site.xml (/usr/lib/hive/conf/hive-site.xml) to 
configure the metastore service to communicate with the MySQL database, and provides sample settings. Though you can 
use the same hive-site.xml on all hosts (client, metastore, HiveServer2), hive.metastore.uris is the only property that 
must be configured on all of them; the others are used only on the metastore host.
### ************************************************************************
### ************************************************************************

更改完配置文件，要重启集群

### ************************************************************************
<property>
  <name>javax.jdo.option.ConnectionURL</name>
  <value>jdbc:mysql://hadoop03/metastore</value>
  <description>the URL of the MySQL database</description>
</property>

<property>
  <name>javax.jdo.option.ConnectionDriverName</name>
  <value>com.mysql.jdbc.Driver</value>
</property>

<property>
  <name>javax.jdo.option.ConnectionUserName</name>
  <value>hive</value>
</property>

<property>
  <name>javax.jdo.option.ConnectionPassword</name>
  <value>hive</value>
</property>

<property>
  <name>datanucleus.autoCreateSchema</name>
  <value>false</value>
</property>

<property>
  <name>datanucleus.fixedDatastore</name>
  <value>true</value>
</property>

<property>
  <name>datanucleus.autoStartMechanism</name> 
  <value>SchemaTable</value>
</property> 

<property>
  <name>hive.metastore.uris</name>
  <value>thrift://hadoop03:9083</value>
  <description>IP address (or fully-qualified domain name) and port of the metastore host</description>
</property>

<property>
<name>hive.metastore.schema.verification</name>
<value>true</value>
</property>




https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/cdh_ig_hive_schema_tool.html#metastore_schema_tool
/opt/cloudera/parcels/CDH/lib/hive/bin/schematool -dbType mysql -passWord hive -userName hive -validate
/opt/cloudera/parcels/CDH/lib/hive/bin/schematool -dbType mysql -info -passWord hive -userName hive

/opt/cloudera/parcels/CDH/lib/hive/bin/schematool -dbType mysql -initSchema -passWord hive -userName hive
