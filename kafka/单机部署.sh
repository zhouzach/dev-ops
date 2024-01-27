
tar -zxvf kafka_2.11-2.2.1.tgz

cd kafka_2.11-2.2.1

vim config/server.properties
listeners=PLAINTEXT://192.168.100.16:9092

#后台启动zookeeper：
./bin/zookeeper-server-start.sh config/zookeeper.properties &

#后台启动kafka：
./bin/kafka-server-start.sh config/server.properties &