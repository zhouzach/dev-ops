
yum install -y gcc

检查redis版本
https://mirrors.tuna.tsinghua.edu.cn/remi/

安装Remi的软件源
yum install -y https://mirrors.tuna.tsinghua.edu.cn/remi/enterprise/remi-release-7.rpm

安装最新版本的redis
yum --enablerepo=remi install -y redis

vim /etc/redis.conf
#开启远程登录连接
bind 0.0.0.0
#disable protected-mode no,远程登录
protected-mode no
#设置为守护进程
daemonize yes

systemctl start redis.service

systemctl status redis.service

systemctl restart redis.service

查看下redis安装时创建的相关文件
rpm -qa |grep redis
rpm -ql redis


查看redis-cli版本
redis-cli --version

设置为开机自动启动
systemctl enable redis.service