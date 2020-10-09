
### RowKey在Region中的作用
在 HBase 中，Region 相当于一个数据的分片，每个 Region 都有StartRowKey和StopRowKey，
这是表示 Region 存储的 RowKey 的范围，HBase 表的数据时按照 RowKey 来分散到不同的 Region，要想将数据记录均衡的
分散到不同的Region中去，因此需要 RowKey 满足这种散列的特点。此外，在数据读写过程中也是与RowKey 密切相关，
RowKey在读写过程中的作用：
1.读写数据时通过 RowKey 找到对应的 Region；
2.MemStore 中的数据是按照 RowKey 的字典序排序；
3.HFile 中的数据是按照 RowKey 的字典序排序。

### RowKey在查询中的作用
HBase中RowKey可以唯一标识一行记录，在HBase中检索数据有以下三种方式：
1.通过 get 方式，指定 RowKey 获取唯一一条记录通过 
2.scan 方式，设置 startRow 和 stopRow 参数进行范围匹配
3.全表扫描，即直接扫描整张表中所有行记录当大量请求访问HBase
集群的一个或少数几个节点，造成少数RegionServer的读写请求过多、负载过大，而其他RegionServer负载却很小，这样就造成
热点现象。大量访问会使热点Region所在的主机负载过大，引起性能下降，甚至导致Region不可用。所以我们在向HBase中插入数据
的时候，应尽量均衡地把记录分散到不同的Region里去，平衡每个Region的压力。


### RowKey的设计
在HBase中RowKey在数据检索和数据存储方面都有重要的作用，一个好的RowKey设计会影响到数据在HBase中的分布，还会影响我们查询效率，
所以一个好的RowKey的设计方案是多么重要。首先我们先来了解下RowKey的设计原则。

#### 长度原则
RowKey是一个二进制码流，可以是任意字符串，最大长度为64kb，实际应用中一般为10-100byte，以byte[]形式保存，
一般设计成定长。建议越短越好，不要超过16个字节，原因如下：数据的持久化文件HFile中时按照Key-Value存储的，
如果RowKey过长，例如超过100byte，那么1000w行的记录，仅RowKey就需占用近1GB的空间。这样会极大影响HFile的存储效率。
MemStore会缓存部分数据到内存中，若RowKey字段过长，内存的有效利用率就会降低，就不能缓存更多的数据，从而降低检索效率。
目前操作系统都是64位系统，内存8字节对齐，控制在16字节，8字节的整数倍利用了操作系统的最佳特性。

#### 唯一原则
必须在设计上保证RowKey的唯一性。由于在HBase中数据存储是Key-Value形式，若向HBase中同一张表插入相同RowKey的数据，
则原先存在的数据会被新的数据覆盖。

#### 排序原则
HBase的RowKey是按照ASCII有序排序的，因此我们在设计RowKey的时候要充分利用这点。

#### 散列原则
设计的RowKey应均匀的分布在各个HBase节点上。

### 字段选择
RowKey字段的选择，遵循的最基本原则是唯一性，RowKey必须能够唯一的识别一行数据。无论应用的负载特点是什么样，RowKey字段都应该参考最高频的查询场景。
数据库通常都是以如何高效的读取和消费数据为目的，而不是数据存储本身。然后，结合具体的负载特点，再对选取的RowKey字段值进行改造，
组合字段场景下需要重点考虑字段的顺序。

### 避免数据热点的方法
在对HBase的读写过程中，如何避免热点现象呢？主要有以下几种方法：
#### Reversing
如果经初步设计出的RowKey在数据分布上不均匀，
但RowKey尾部的数据却呈现出了良好的随机性，此时，可以考虑将RowKey的信息翻转，或者直接将尾部的bytes提前到RowKey的开头。
Reversing可以有效的使RowKey随机分布，但是牺牲了RowKey的有序性。缺点：利于Get操作，但不利于Scan操作，因为数据在原RowKey上的自然顺序已经被打乱。
SaltingSalting（加盐）的原理是在原RowKey的前面添加固定长度的随机数，也就是给RowKey分配一个随机前缀使它和之间的RowKey的开头不同。
随机数能保障数据在所有Regions间的负载均衡。缺点：因为添加的是随机数，基于原RowKey查询时无法知道随机数是什么，那样在查询的时候就需要去各个可能的Regions中查找，
Salting对于读取是利空的。并且加盐这种方式增加了读写时的吞吐量。Hashing基于 RowKey 的完整或部分数据进行 Hash，而后将Hashing后的值完整替换或部分替换原RowKey的前缀部分。
这里说的 hash 包含 MD5、sha1、sha256 或 sha512 等算法。缺点：与 Reversing 类似，Hashing 也不利于 Scan，因为打乱了原RowKey的自然顺序。



reverse(userid) + timestamp + 变化场景
