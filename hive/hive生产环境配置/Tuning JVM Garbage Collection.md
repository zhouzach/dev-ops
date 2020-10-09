
https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/cm-tune-g1gc.html#cm-tune-g1gc

HADOOP_CLIENT_OPTS=-Xms4294967296 -Xmx4294967296 {{JAVA_GC_ARGS}} -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/hive_hive-HIVESERVER2-4cafcc7e566c3e8a25196c44c537b178_pid{{PID}}.hprof -XX:OnOutOfMemoryError={{AGENT_COMMON_DIR}}/killparent.sh

-XX:+UseParNewGC 
-XX:+UseConcMarkSweepGC 
-XX:CMSInitiatingOccupancyFraction=70 
-XX:+CMSParallelRemarkEnabled

-XX:MetaspaceSize=512M -XX:MaxMetaspaceSize=512M -XX:-UseGCOverheadLimit