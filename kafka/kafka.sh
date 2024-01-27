
#列出topic
kafka-topics --bootstrap-server dm-host118:9092,dm-host211:9092,dm-host214:9092 --list

#查看topic
kafka-console-consumer --bootstrap-server dm-host118:9092,dm-host211:9092,dm-host214:9092 --topic t_0420 --from-beginning