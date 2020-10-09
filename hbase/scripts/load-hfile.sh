
hdfs dfs -ls hdfs://nameservice1/test/data | awk '{print $8}' | tail -n +4 |  while read line;

do

  echo $line;
  hbase org.apache.hadoop.hbase.tool.LoadIncrementalHFiles $line ods:user_hbase13

done