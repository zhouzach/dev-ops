
https://www.alibabacloud.com/help/zh/doc-detail/59039.htm?spm=a2c63.p38356.b99.34.39a5d8dbm0yAl1

EMR支持的ECS实例类型
通用型
vCPU : Memory = 1 : 4。例如，8核32GiB，使用云盘作为存储。

计算型
vCPU : Memory = 1 : 2。例如，8核16GiB，使用云盘作为存储，提供了更多的计算资源。

内存型
vCPU : Memory = 1 : 8。例如， 8核64GiB，使用云盘作为存储，提供了更多的内存资源。

大数据型
使用本地SATA盘作存储数据，存储性价比高，是大数据量（TB 级别的数据量）场景下的推荐机型。

说明 当前只有Core节点支持大数据型实例。当前只有Hadoop、Flink和Druid类型的集群支持Core节点；Zookeeper和Kafka类型的集群不支持。
本地SSD型
使用本地SSD盘，拥有极高的本地IOPS和吞吐能力。

共享型（入门级）
共享CPU的机型，在大计算量的场景下，稳定性不够。入门级学习使用，不推荐企业客户使用。

GPU
使用GPU的异构机型，可以用来运行机器学习等场景。

实例类型适用场景
Master主实例
适合通用型或内存型实例，数据直接使用阿里云的云盘来保存，数据高可靠（三备份）。

Core核心实例
小数据量（TB级别以下）或者是使用OSS作为主要的数据存储时，推荐使用通用型、计算型或内存型。
大数据量（10TB或以上）情况下，推荐使用大数据机型，可获得极高的性价比。
当Core核心实例使用本地盘时，数据由EMR平台进行维护，可靠性得不到保证。
Task计算实例
Task计算实例用于补充集群的计算能力，可使用除大数据型外的所有机型。目前本地SSD型尚未支持，后续会加入到Task 中。