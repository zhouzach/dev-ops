
BlockCache作为读缓存，合理设置对于提高读性能非常重要。默认情况下，BlockCache和MemStore的配置各占40%，可以根据集群业务
进行修正，比如读多写少业务可以将BlockCache占比调大。另外BlockCache的策略也很重要，不同策略对读性能来说影响并不大，
但是对GC的影响 却很显著。HBase缓存区大小，主要影响查询性能。根据查询模式以及查询记录分布情况来决定缓存区的大小。如果采用
随机查询使得缓存区的命中率较低，可以适当降低缓存大小。


hfile.block.cache.size，默认0.4，用来提高读性能hbase.regionserver.global.memstore.size，默认0.4，用来提高写性能
