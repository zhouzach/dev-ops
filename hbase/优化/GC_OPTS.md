
HBase是利用内存完成读写操作。提高HBase内存可以有效提高HBase性能。GC_OPTS主要需要调整HeapSize和NewSize的大小。
调整HeapSize大小的时候，建议将Xms和Xmx设置成相同的值，这样可以避免JVM动态调整HeapSize大小的时候影响性能。
调整NewSize大小的时候，建议把其设置为HeapSize大小的1/9。当HBase集群规模越大，Region数量越多时，可以适当调大HMaster的
GC_OPTS参数RegionServer需要比HMaster更大的内存，在内存充足的情况下，HeapSize可以相对设置大一些。HMaster的HeapSize
为4G的时候，HBase集群可以支持100000个Region的规模。根据经验值，单个RegionServer的HeapSize不建议超过20GB。


# HMaster、RegionServer GC_OPTS配置如下：
HMaster: 
-Xms2G -Xmx2G -XX:NewSize=256M -XX:MaxNewSize=256M 
RegionServer: 
-Xms4G -Xmx4G -XX:NewSize=512M -XX:MaxNewSize=512M