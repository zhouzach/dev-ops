
https://blog.csdn.net/qq_16038125/article/details/72488327

row key是十六进制的字符串(hexadecimal ASCII)作为前缀的时候
HexHash(prefix)作为row key的前缀，其中Hexhash为最终得到十六进制字符串的hash算法
#方式一
create 'mytable', { NAME => 'info', COMPRESSION => 'snappy' },  {NUMREGIONS => 60, SPLITALGO => 'HexStringSplit'}

#方式二
hbase org.apache.hadoop.hbase.util.RegionSplitter mytable HexStringSplit -c 10 -f f1


region大小配置：
hbase.hregion.max.filesize 10G
https://www.cnblogs.com/duanxz/p/3154487.html
当region中的StoreFile大小超过了上面配置的值的时候，该region就会被拆分，具体的拆分策略见下文。
上面的值也可以针对每个表单独设置，例如在hbase shell中设置：
create 't','f'
disable 't'
alter 't', METHOD => 'table_att', MAX_FILESIZE => '134217728'
enable 't'

MemStore大小：
通常HBase的一个MemStore默认大小为128 MB，见参数hbase.hregion.memstore.flush.size
所有MemStore占HBASE_HEAPSIZE的比例, 0.4: hbase.regionserver.global.memstore.size 


每个节点最理想的Region数量应该由以下公式计算（假设HBase表都有统一的列族配置）:
((RS memory) * (total memstore fraction)) / ((memstore size)*(column families))
其中：

RS memory：表示regionserver堆内存大小，即HBASE_HEAPSIZE。
total memstore fraction：表示所有MemStore占HBASE_HEAPSIZE的比例，HBase0.98版本以后由hbase.regionserver.global.memstore.size参数控制，老版本由hbase.regionserver.global.memstore.upperLimit参数控制，默认值0.4。
memstore size：即每个MemStore的大小，原生HBase中默认128M。
column families：即表的列族数量，通常情况下只设置1个，最多不超过3个。
举个例子，假如一个集群中每个RegionServer的堆内存是32GB，那么节点上最理想的Region数量应该是32768*0.4/128 ≈ 102，所以，当前环境中单节点理想情况下大概有102个Region。

HBase分区过多影响&合理分区数量
https://cloud.tencent.com/developer/article/1488479