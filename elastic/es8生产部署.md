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

*               soft    nofile          65535
*               hard    nofile          65535
*               hard    nproc           65535
*               soft    nproc           65535


vim /etc/sysctl.conf
vm.max_map_count=262144

# 执行生效
sysctl -p


mkdir -p /data/app/elastic/data
mkdir -p /data/app/elastic/log
chown -R elastic:elastic /data/app/elastic
chown -R elastic:elastic elasticsearch-8.1.3


su - elastic
cd /data/opt/elasticsearch-8.1.3

vim config/elasticsearch.yml
cluster.name: dw-index
node.name: node-wh2
path.data: /data/app/elastic/data
path.logs: /data/app/elastic/log
network.host: 192.168.100.211
discovery.seed_hosts: ["dm-host118", "dm-host211", "dm-host214"]
bootstrap.memory_lock: false
cluster.initial_master_nodes: ["node-wh2"]

xpack.security.enabled: false
xpack.security.enrollment.enabled: false
xpack.security.http.ssl.enabled: false
xpack.security.transport.ssl.enabled: false

http.cors.enabled: true
http.cors.allow-origin: "*"
http.cors.allow-headers: Authorization,X-Requested-With,Content-Type,Content-Length

vim config/jvm.options
-Xms2g
-Xmx2g


通过后台启动并且指定pid文件
./bin/elasticsearch -p /data/app/elastic/elasticsearch-pid -d

找到pid号通过kill命令停止
cat /tmp/elasticsearch-pid && echo
15516
kill -SIGTERM 15516

ps -ef|grep elasticsearch
netstat -an|grep 9200