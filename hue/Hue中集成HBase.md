
https://cloud.tencent.com/developer/article/1646333

hbase用户通过Hue UI admin用户创建


# Api 错误：500 Server Error: Server Error for url: http://qile-test-cdh003:9090/ 
org.apache.hadoop.security.authorize.AuthorizationException: User: hbase is not allowed to impersonate hue

https://blog.csdn.net/lhmood/article/details/106584051
问题解决
修改配置
在CloudManager的HDFS服务->高级->core-site.xml增加如下配置：
hadoop.proxyuser.hbase.hosts
*

hadoop.proxyuser.hbase.groups
*
