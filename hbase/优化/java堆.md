
https://blog.csdn.net/weixin_39198774/article/details/79477174

其中客户端java堆大小是相对于客户端来说的，所以不需要很大，256M应该够用了。

Hbase REST Server 和Hbase Trift Server是除了java之外其他客户端访问HBase所需要的，所以也不需要很大，给个256M已经很不错了，后期根据访问的语言来进行修改。（如果有需要都调到2G）

Hbase Master的Java堆栈大小暂时可以1G，后期看日志，如果GC时间长，可以向上调整，主要看到时候集群的具体情况

Hbase RegionServer的java堆栈大小建议是调整到4G

问题后续：

参数修改之后，重新跑测试程序，顺利通过。

总结：

如果hbase的regionServer退出，并且没有打印错误日志，那么先检查hbase对内存设置