书：Hbase实战
Master节点
cpu: 4核
memory： 16g
disk：2块,一块用于操作系统，一块用于master日志
HBaseMaster不承担很重的负载，并且为了故障切换的目标你可以部署多个Master。
由于这两个因素，为HBaseMaster配置昂贵的、内置冗余的硬件有些过头。你不会因此得到太多好处。
HBaseMaster节点服务器的典型硬件配置是4核CPU、8～16GBDDR3RAM、
2块SATA硬盘（一块用于操作系统，另一块用于HBaseMaster日志）和1块1Gb以太网卡。
通过使用多台HBaseMaster来构建系统冗余，这样应该就可以了。小结HBaseMaster是一个轻量级进程，
不需要很多资源，但是如果可能的话，把它部署到单独的硬件上是明智之举。可以配置多个HBaseMaster进行冗余处理。
4核CPU、8～16GBRAM和2块硬盘对HBaseMaster节点来说足够了。

申请：
2台：8核16G云盘,一块用于操作系统，一块用于数据盘
       


工作节点：包含Datanode和regionserver
HBaseRegionServer是内存贪婪型的，可以轻松消耗掉你给的所有RAM。
但这并不意味着你要给RegionServer进程分配30GB的堆空间。否则你会迅速进入stoptheworld垃圾收集器（garbagecollector），
然后你的系统马上崩溃。记住，HBase是对延迟敏感的，而stoptheworld垃圾回收是它的克星。
按照经验判断，为RegionServer分配10～15GB堆内存时表现良好，不过你应该针对你的工作负载进行测试以找出最优值。
如果你正在运行的是HBase（当然还有HDFS），工作节点需要为DataNode、RegionServer、操作系统和其他进程（监控代理等）
配置8～12核CPU。再加上24～32GB内存和12块1TB硬盘，这样应该就可以了。
在服务器上增加额外的内存总是没有坏处的，可以用做文件系统的缓存。
为了得到更高的存储密度，你可以增加硬盘数量，但是不要加得太多，否则在节点或硬盘故障时复制副本会很耗时。
建议：选择大量的配置合理的服务器，而不是少量的性能强大的服务器。

申请：
2台：8核16G云盘,一块用于操作系统，一块用于数据盘
3台：16核32g3块SSD云盘,一块用于操作系统，两块用于数据盘





https://juejin.im/entry/5be3b1def265da613621f352

CPU核数越多越好，HBase本身压缩数据、compaction线程等都是很吃CPU资源的。
内存不用太高，一般128G就已经特别多了HBase本身对内存的需求并不是配的越大越好,内存给多了GC起来是个灾难
SSD,磁盘尽可能大
集群使用万兆网卡（千兆对于大数据集群来说实在太小，很容易打满，影响较大）


Region规划
对于Region的大小，HBase官方文档推荐单个在10G-30G之间，单台RegionServer的数量控制在20-200之间。

Region过大过小都会有不良影响：

过大的Region

优点：迁移速度快、减少总RPC请求、减少Flush
缺点：compaction的时候资源消耗非常大、可能会有数据分散不均衡的问题
过小的Region

优点：集群负载平衡、HFile比较少compaction影响小
缺点：迁移或者balance效率低、频繁flush导致频繁的compaction、维护开销大
按照官方推荐的配置最多可以存储的数据量大概为200 * 30G ＊ 3＝ 18T。如果存储的数据量超过18T，或多或少会有些性能问题。从Region规模这个角度讲，当前单台RegionServer能够合理利用起来的硬盘容量上限基本为18T（已提出Sub-Region的概念来满足超大硬盘的需求）。

视磁盘空间、机器数量而定，当前Region配置为：

hbase.hregion.max.filesize=30G
单节点最多可存储的Region个数约为200