https://docs.cloudera.com/documentation/enterprise/latest/topics/cm_mc_yarn_service.html

yarn.nodemanager.resource.cpu-vcores: 除去系统资源之后，每个节点应该设置的cpu核数
yarn.nodemanager.resource.memory-mb:  除去系统资源之后，每个节点应该设置的内存

yarn.scheduler.maximum-allocation-vcores: 分配给container的最大vcore数,同yarn.nodemanager.resource.cpu-vcores
yarn.scheduler.maximum-allocation-mb: 分配给container的最大内存,同yarn.nodemanager.resource.memory-mb

Map task配置
mapreduce.map.cpu.vcores
mapreduce.map.memory.mb: 10G
mapreduce.map.java.opts

Reduce task配置
mapreduce.reduce.cpu.vcores
mapreduce.reduce.memory.mb: 10G
mapreduce.reduce.java.opts

