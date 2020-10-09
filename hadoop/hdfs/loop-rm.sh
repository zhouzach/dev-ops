
data=$1
hdfs dfs -ls /user/hdfs | awk '{print $8}' | tail -n +6 | while read line; do echo $line; done
hdfs dfs -ls /user/hdfs | awk '{print $8}' | tail -n +6 | while read line; do hdfs dfs -rm -r -skipTrash $line; done
