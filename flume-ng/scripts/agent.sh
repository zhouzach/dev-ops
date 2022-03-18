
nohup flume-ng agent --conf /etc/flume-ng/conf --conf-file /etc/flume-ng/conf/flume-sample.conf -Dflume.root.logger=DEBUG,console --name a1 -Xmx512m -Xms256m >> /data/log/flume-ng/file2kafka.log 2>&1 &


# agent name 必须与conf 文件中的agent name 一致
./bin/flume-ng agent --conf ./conf/ -f conf/f1.conf -Dflume.root.logger=DEBUG,console -n agent1