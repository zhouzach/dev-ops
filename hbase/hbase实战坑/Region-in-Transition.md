
https://community.cloudera.com/t5/Support-Questions/HBase-Region-in-Transition/td-p/26703

1. Stop HBase
2. Move your original /hbase back into place
3. Use a zookeeper cli such as "hbase zkcli"[1] and run "deleteall /hbase" to delete the HBase znodes
4. Restart HBase. It will recreate the znodes

 

If Hbase fails to start after this, you can always try the offline Meta repair:
hbase org.apache.hadoop.hbase.util.hbck.OfflineMetaRepair

 

Also check for inconsistencies after HBase is up.  As the hbase user, run "hbase hbck -details". If there are inconsistencies reported, normally I would use the "ERROR" messages from the hbck output to decide on the best repair method, but since you were willing to start over just run "hbase hbck -repair".

 

If the above fails, you can always try the offline Meta repair:

hbase org.apache.hadoop.hbase.util.hbck.OfflineMetaRepair

 

[1] http://hbase.apache.org/book.html#trouble.tools
[2] http://hbase.apache.org/book.html#hbck.in.depth