
#查询一个包是否安装
rpm -q mysql-community-server
或者
rpm -qa |grep mysql
rpm -qa|grep python

#一个rpm包的相关信息
rpm -qi mysql-community-server
rpm -qi python

#列出一个rpm包安装的文件
rpm -ql mysql-community-server
rpm -ql python

#查询/验证文件属于的软件包
#which tree 这条命令是由两个反引号引起来的，这代表引用反引号里面的命令所产生的结果
rpm -qf `which python`