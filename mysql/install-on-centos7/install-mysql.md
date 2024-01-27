
https://www.cnblogs.com/yangmingxianshen/p/11278319.html


首先需要删除已经存在的mysql，不然后面会报错：
yum remove  mysql mysql-server mysql-libs mysql-server

查找残余文件：
rpm -qa | grep -i mysql
将查找出来的文件逐条删除。

查找残余目录：
whereis mysql
删除参与目录。

查看YUM源：
yum repolist all | grep mysql


访问YUM源网址：https://repo.mysql.com/
选择合适版本
rpm -ivh https://repo.mysql.com/mysql57-community-release-el7-11.noarch.rpm

查看是否已经安装成功：
yum repolist enabled | grep "mysql.*-community.*"


使用这种方式进行安装MySQL会默认安装最新版本，此处就是5.7版本。如过你要安装5.6怎么办？
首先查看被禁用的YUM源：
yum repolist all | grep mysql


yum install -y yum-utils
yum-config-manager --disable mysql57-community
yum-config-manager --enable mysql56-community


yum install mysql-community-server

网速慢，手动下载
https://dev.mysql.com/downloads/mysql/5.7.html?os=src
本地安装
yum localinstall -y mysql-community-common-5.7.38-1.el7.x86_64.rpm
yum localinstall -y mysql-community-libs-5.7.38-1.el7.x86_64.rpm
yum localinstall -y mysql-community-client-5.7.38-1.el7.x86_64.rpm
yum localinstall -y mysql-community-server-5.7.38-1.el7.x86_64.rpm


systemctl start mysqld.service
systemctl status mysqld.service
systemctl stop mysqld.service

查看MySQL的初始密码：
grep 'temporary password' /var/log/mysqld.log
2022-05-05T08:33:01.126215Z 1 [Note] A temporary password is generated for root@localhost: !bh=)pct:01F
初始密码：
!bh=)pct:01F

mysql -uroot -p

set global validate_password_policy=0;
set global validate_password_length=1;
alter user 'root'@'localhost' identified by '123456';
GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '123456';
flush privileges;