
17-07-2020 00:11:10 CST bill-day INFO - [2020-07-17 00:11:08.730]Container [pid=925,containerID=container_e14_1594895045814_0002_01_000002] is running 94359552B beyond the 'PHYSICAL' memory limit. Current usage: 1.1 GB of 1 GB physical memory used; 4.7 GB of 2.1 GB virtual memory used. Killing container.
17-07-2020 00:11:10 CST bill-day INFO - Dump of the process-tree for container_e14_1594895045814_0002_01_000002 :
17-07-2020 00:11:10 CST bill-day INFO - 	|- PID PPID PGRPID SESSID CMD_NAME USER_MODE_TIME(MILLIS) SYSTEM_TIME(MILLIS) VMEM_USAGE(BYTES) RSSMEM_USAGE(PAGES) FULL_CMD_LINE
17-07-2020 00:11:10 CST bill-day INFO - 	|- 1169 925 925 925 (java) 1550 87 5086932992 284894 /usr/java/jdk1.8.0_161/bin/java -Djava.net.preferIPv4Stack=true -Dhadoop.metrics.log.level=WARN -Djava.net.preferIPv4Stack=true -Xmx3072m -Djava.io.tmpdir=/data/yarn/nm/usercache/hdfs/appcache/application_1594895045814_0002/container_e14_1594895045814_0002_01_000002/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/data/yarn/container-logs/application_1594895045814_0002/container_e14_1594895045814_0002_01_000002 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog org.apache.hadoop.mapred.YarnChild 172.16.215.72 46216 attempt_1594895045814_0002_m_000000_0 15393162788866 
17-07-2020 00:11:10 CST bill-day INFO - 	|- 925 923 925 925 (bash) 0 1 9744384 287 /bin/bash -c /usr/java/jdk1.8.0_161/bin/java -Djava.net.preferIPv4Stack=true -Dhadoop.metrics.log.level=WARN  -Djava.net.preferIPv4Stack=true -Xmx3072m -Djava.io.tmpdir=/data/yarn/nm/usercache/hdfs/appcache/application_1594895045814_0002/container_e14_1594895045814_0002_01_000002/tmp -Dlog4j.configuration=container-log4j.properties -Dyarn.app.container.log.dir=/data/yarn/container-logs/application_1594895045814_0002/container_e14_1594895045814_0002_01_000002 -Dyarn.app.container.log.filesize=0 -Dhadoop.root.logger=INFO,CLA -Dhadoop.root.logfile=syslog org.apache.hadoop.mapred.YarnChild 172.16.215.72 46216 attempt_1594895045814_0002_m_000000_0 15393162788866 1>/data/yarn/container-logs/application_1594895045814_0002/container_e14_1594895045814_0002_01_000002/stdout 2>/data/yarn/container-logs/application_1594895045814_0002/container_e14_1594895045814_0002_01_000002/stderr  
17-07-2020 00:11:10 CST bill-day INFO - 
17-07-2020 00:11:10 CST bill-day INFO - [2020-07-17 00:11:08.737]Container killed on request. Exit code is 143
17-07-2020 00:11:10 CST bill-day INFO - [2020-07-17 00:11:08.747]Container exited with a non-zero exit code 143


https://blog.csdn.net/Abysscarry/article/details/80331311

mapreduce.map.memory.mb
mapreduce.reduce.memory.mb
默认为1G，调整为10G