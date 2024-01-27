https://blog.csdn.net/liaomingwu/article/details/123353890

groupadd elastic
useradd elastic -g elastic
passwd elastic
elastic


vim /etc/security/limits.conf

[comment]: <> (elastic soft nofile 65536)

[comment]: <> (elastic hard nofile 65536)

[comment]: <> (elastic soft nproc  65536)

[comment]: <> (elastic hard nproc  65536)

*               soft    nofile          65536
*               hard    nofile          65536
*               hard    nproc           65536
*               soft    nproc           65536


vim /etc/sysctl.conf
vm.max_map_count=262144

# 执行生效
sysctl -p


mkdir -p /data/app/elasticsearch/data
mkdir -p /data/app/elasticsearch/log
chown -R elastic:elastic /data/app/elasticsearch
chown -R elastic:elastic elasticsearch-6.2.4


su - elastic
cd /data/opt/elasticsearch-6.2.4

vim config/elasticsearch.yml
cluster.name: dw-index6
node.name: node-wh16
path.data: /data/app/elasticsearch/data
path.logs: /data/app/elasticsearch/log
network.host: 192.168.100.16
bootstrap.memory_lock: false

http.cors.enabled: true
http.cors.allow-origin: "*"
http.cors.allow-headers: Authorization,X-Requested-With,Content-Type,Content-Length

vim config/jvm.options
-Xms1g
-Xmx1g


通过后台启动并且指定pid文件
./bin/elasticsearch -p /data/app/elasticsearch/elasticsearch-pid -d

找到pid号通过kill命令停止
cat /tmp/elasticsearch-pid && echo
15516
kill -SIGTERM 15516

ps -ef|grep elasticsearch
netstat -an|grep 9200