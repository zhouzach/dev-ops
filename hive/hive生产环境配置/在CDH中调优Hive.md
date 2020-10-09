
### 
https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/admin_hive_tuning.html#tuning_troubleshooting_hs2_perf

Cloudera recommends that you determine the total number of HS2 servers on a cluster by dividing the expected maximum number of 
concurrent users on a cluster by 40. For example, if 400 concurrent users are expected, 10 HS2 instances should be available to support them.

To set these parameters in Cloudera Manager, go to Home > Hive > Configuration > HiveServer2 > Advanced , and then search for each parameter.
hive.server2.idle.operation.timeout=7200000
hive.server2.idle.session.timeout=21600000
