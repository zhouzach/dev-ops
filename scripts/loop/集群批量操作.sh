#!/usr/bin/env bash

declare -a hosts=("cdh1" "cdh2" "cdh3" "cdh4")

## now loop through the above array
# 使用 @ 符号可以获取数组中的所有元素
for host in "${hosts[@]}"
do
  ssh $host "rm -rf /opt/flink-1.11.1/lib/hadoop-common-3.0.0-cdh6.3.2.jar"
done

for ip in `cat iplist.txt`;
do
	ssh $ip "free -g";
done

