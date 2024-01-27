一、主机操作系统优化

1）关闭防火墙(集群中所有机器上执行)

# systemctl stop firewalld
# systemctl disable firewalld

2）关闭selinux(集群中所有机器上执行)

# setenforce  0
# sed -i "s/^SELINUX=enforcing/SELINUX=disabled/g" /etc/sysconfig/selinux
# sed -i "s/^SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
# sed -i "s/^SELINUX=permissive/SELINUX=disabled/g" /etc/sysconfig/selinux
# sed -i "s/^SELINUX=permissive/SELINUX=disabled/g" /etc/selinux/config

3）时间同步(集群中所有机器上执行，请务必保证集群中主机时间同步；)（可选项，若不定时同步，则建议 定时检查集群所有节点的时间）

# yum install ntpdate -y
# ntpdate 0.rhel.pool.ntp.org

4）设定时区

#查看时区 # 
timedatectl status
# timedatectl list-timezones | grep Shanghai
# timedatectl set-timezone Asia/Shanghai

二、安装和配置zabbix

A. centos7 + zabbix5.0安装手册

1）安装zabbix-server和agent

# rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
# yum clean all
# yum install zabbix-server-mysql zabbix-agent
# yum install centos-release-scl

2)编辑zabbix.repo and enable zabbix-frontend repository

vim /etc/yum.repos.d/zabbix.repo
[zabbix-frontend]
...
enabled=1
...

3）安装Zabbix frontend packages.

yum install zabbix-web-mysql-scl zabbix-apache-conf-scl

4）安装mysql

yum -y install numactl
wget https://mirrors.huaweicloud.com/mysql/Downloads/MySQL-8.0/mysql-community-common-8.0.26-1.el7.x86_64.rpm
wget https://mirrors.huaweicloud.com/mysql/Downloads/MySQL-8.0/mysql-community-libs-8.0.26-1.el7.x86_64.rpm
wget https://mirrors.huaweicloud.com/mysql/Downloads/MySQL-8.0/mysql-community-client-8.0.26-1.el7.x86_64.rpm
wget https://mirrors.huaweicloud.com/mysql/Downloads/MySQL-8.0/mysql-community-server-8.0.26-1.el7.x86_64.rpm
wget https://mirrors.huaweicloud.com/mysql/Downloads/MySQL-8.0/mysql-community-client-plugins-8.0.26-1.el7.x86_64.rpm
wget https://mirrors.huaweicloud.com/mysql/Downloads/MySQL-8.0/mysql-community-libs-compat-8.0.29-1.el7.x86_64.rpm
rpm -ivh mysql-community-common*
rpm -ivh mysql-community-client-plugins-8.0.26-1.el7.x86_64.rpm
rpm -ivh mysql-community-libs*
rpm -ivh mysql-community-client-8.0.*
rpm -ivh mysql-community-server*
rpm -ivh mysql-community-libs-compat-8.0.29-1.el7.x86_64.rpm

#启动服务
systemctl start mysqld
#查看随机密码
cat /var/log/mysqld.log

命令行方式登录：输入命令，回车，输入那个随机密码
mysql -u root -p

set global validate_password.policy=0;
set global validate_password.length=4;

#修改密码
ALTER USER 'root'@'localhost' IDENTIFIED BY 'psc@2021';

5）数据库初始化

# mysql -uroot -p
password
mysql> create database zabbix character set utf8 collate utf8_bin;
mysql> create user zabbix@localhost identified by 'zabbix';
mysql> grant all privileges on zabbix.* to zabbix@localhost;
#mysql8.0版本需要执行如下语句
mysql> ALTER USER 'zabbix'@'localhost' IDENTIFIED WITH mysql_native_password BY 'zabbix';
mysql> FLUSH PRIVILEGES;
mysql> quit;

# zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix

6）配置zabbix-server

vim /etc/zabbix/zabbix_server.conf
DBPassword=zabbix

7）配置PHP时区(去掉行首的分号注释符)

vim /etc/opt/rh/rh-php72/php-fpm.d/zabbix.conf
php_value[date.timezone] = Asia/Shanghai

8)启动Zabbix server和agent

# systemctl restart zabbix-server zabbix-agent httpd rh-php72-php-fpm
# systemctl enable zabbix-server zabbix-agent httpd rh-php72-php-fpm

9）前端页面配置

浏览器访问http://server_ip_or_name/zabbix
根据向导完成配置

B. centos8-stream + zabbix5.0安装手册

注意：centsos8操作系统的优化配置与第一部分相同，不再重复说明

1）安装zabbix server, 前端， zabbix agent

# rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/8/x86_64/zabbix-release-5.0-1.el8.noarch.rpm
# dnf clean all
# dnf install zabbix-server-mysql zabbix-web-mysql zabbix-apache-conf zabbix-agent

2）安装zabbix server安装mysql

# dnf -y install mysql-server
# systemctl start mysqld

3） 数据库表初始化

# mysql -uroot -p
#按上面初始化安装后没有默认，直接点回车即可,进入mysql后建议设置root帐号密码
mysql> create database zabbix character set utf8 collate utf8_bin;
mysql> create user zabbix@localhost identified by 'zabbix';
mysql> grant all privileges on zabbix.* to zabbix@localhost;
mysql> quit;

# zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -uzabbix -p zabbix
#回车后输入zabbix用户密码，就是上面创建zabbix用户时设置的密码zabbix

4）修改Zabbix server配置文件

vim /etc/zabbix/zabbix_server.conf
#下面两行前面的#注释符删除掉，配置下密码
DBHost=localhost
DBPassword=zabbix

5）配置Zabbix前端时区(去掉行首的分号注释符)

vim /etc/php-fpm.d/zabbix.conf
php_value[date.timezone] = Asia/Shanghai

6）启动Zabbix server和zabbix agent 进程

# systemctl restart zabbix-server zabbix-agent httpd php-fpm
# systemctl enable zabbix-server zabbix-agent httpd php-fpm

7）浏览器访问前端页面并配置

浏览器访问: http://server_ip_or_name/zabbix
根据向导完成配置即可。