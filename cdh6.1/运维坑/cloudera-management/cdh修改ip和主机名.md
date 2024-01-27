
https://www.cxyzjd.com/article/user_0000/62420899


1、首先在安装cloudera-manager的主机上（集群主节点），停止所有的cloudera管理进程

systemctl status cloudera-scm-agent
systemctl status cloudera-scm-server

systemctl stop cloudera-scm-agent
systemctl stop cloudera-scm-server

systemctl restart cloudera-scm-agent


2.登上scm数据库在mysql上
use scm;
select host_id, host_identifier, name, ip_address from `HOSTS`;

update `HOSTS` set ip_address = '192.168.100.211' where host_id=1;

update `HOSTS` set `NAME` = 'dm-host211' where host_id=1;

3、 修改 所有机器 的cloudera-scm-agent的配置文件
1）打开cloudera-scm-agent的配置文件

vim /etc/cloudera-scm-agent/config.ini

2）修改server_host的值(这个是指定cloudera-scm-server的ip)

将该值设置为cloudera-scm-server的ip即可。

4、修改主机的ip地址(此步所有主机都要做)：

1）改为你指定的ip

vim /etc/sysconfig/network-scripts/ifcfg-ens192

2）改hosts, 域名 ip 映射关系

vi /etc/hosts

    5、   重启服务，结束。

systemctl start cloudera-scm-agent
systemctl start cloudera-scm-server

*********************************************************************************************************

    6、如果仅是改ip上面的步骤就够用了，hostname也需要改 的话。我们继续

         需要修改数据库里，两张表，否则 ActivityMonitor 起不来。

        1)进入到对应的数据库。 

update HOSTS set name=hostname where host_id=3;

改成对应 的 主机名 。

2) 查看CONFIGS表相关列, 【cdh13是我的主机名】

   select config_id,attr,value from CONFIGS where value like '%cdh13%';
   查询结果如下：

config_id              |    attr   |                   value

           --------------------------------------------------------------
12        remote_parcel_repo_urls       http://cdh13/cdh/parcels;http://............

18        firehose_database_host         cdh13


注意上面的，将cdh13修改为指定的主机名即可。

上面修改完后，就快完成了，剩下的工作就是把，主机的hostname 改掉，重启相关服务即可。

注意：修改主机名  vi /etc/sysconfig/network  ,修改后，重启网卡：service network restart  ，输入hostname 看出现的主机名

是否是期待的主机名。如果修改后没有更新，reboot 重启机器即可，完事。