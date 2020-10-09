
https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/cdh_ig_hive_metastore_configure.html

Tune the backend (the RDBMS). HiveServer connects to HMS, and only HMS connects to the RDBMS. The longer the backend takes, the more memory the HMS needs to respond to the same requests. Limit the number of connections in the backend database.
MySQL: For example, in /etc/my.cnf:

[mysqld]
datadir=/var/lib/mysql
max_connections=8192
. . .
MariaDB: For example, in /etc/systemd/system/mariadb.service.d/limits.conf:

[Service]
LimitNOFILE=24000
. . .
Use default thrift properties (8K):
hive.server2.async.exec.threads 8192
hive.server2.async.exec.wait.queue.size 8192
hive.server2.thrift.max.worker.threads 8192
Set datanucleus.connectionPool.maxPoolSize for your applications. For example, if poolSize = 100, with 3 HMS instances (one dedicated to compaction), and with 4 pools per server, you can accommodate 1200 connections.
