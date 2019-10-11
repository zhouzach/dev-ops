
https://www.jianshu.com/p/411274f96492

安装firewalld防火墙 yum install firewalld

开启服务systemctl start firewalld.service

关闭防火墙systemctl stop firewalld.service

开机自动启动systemctl enable firewalld.service

关闭开机制动启动systemctl disable firewalld.service

使用 firewall-cmd 命令
查看状态 firewall-cmd --state //running 表示运行

获取活动的区域 firewall-cmd --get-active-zones
获取所有支持的服务 firewall-cmd --get-service
在不改变状态的条件下重新加载防火墙 firewall-cmd --reload

启用某个服务
firewall-cmd --zone=public --add-service=https //临时
firewall-cmd --permanent --zone=public --add-service=https //永久

开启某个端口
firewall-cmd --permanent --zone=public --add-port=8080-8081/tcp //永久
firewall-cmd --zone=public --add-port=8080-8081/tcp //临时
使用命令加载设置firewall-cmd --reload

开启udp端口范围
firewall-cmd --zone=public --permanent --add-port=60000-61000/udp

查看开启的端口和服务
firewall-cmd --permanent --zone=public --list-services //服务空格隔开 例如 dhcpv6-client https ss
firewall-cmd --permanent --zone=public --list-ports //端口空格隔开 例如 8080-8081/tcp 8388/tcp 80/tcp