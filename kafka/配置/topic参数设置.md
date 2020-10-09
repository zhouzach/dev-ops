
#一个topic ，默认分区的replication个数 ，不能大于集群中broker的个数
default.replication.factor

https://www.linkedin.com/pulse/kafka-optimization-how-many-partitions-needed-maria-hatfield-phd

For most implementations you want to follow the rule of thumb of 10 partitions per topic, 
and 10,000 partitions per Kafka cluster. Going beyond that amount can require additional monitoring and optimization.

# Partitions = Desired Throughput / Partition Speed

Conservatively, you can estimate that a single partition for a single Kafka topic runs at 10 MB/s.

As an example, if your desired throughput is 5 TB per day. That figure comes out to about 58 MB/s. 
Using the estimate of 10 MB/s per partition, this example implementation would require 6 partitions.

For the example above, the number of partitions is set using the following code:

bin/kafka-topics.sh –zookeeper ip_addr_of_zookeeper:2181 –create –topic my-topic –partitions 6 –replication-factor 3 
–config max.message.bytes=64000 –config flush.messages=1

# Kafka的Topic的partitions数目设置最佳实践
https://www.jianshu.com/p/8c07039437d0