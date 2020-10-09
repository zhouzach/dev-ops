
https://masterwangzx.com/2020/05/19/spark-gc-time/

https://stackoverflow.com/questions/28166667/how-to-pass-d-parameter-or-environment-variable-to-spark-job



--conf 'spark.driver.extraJavaOptions=-XX:+PrintGC -XX:+PrintGCDetails -Xloggc:gc.log -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -XX:+PrintHeapAtGC -XX:+PrintReferenceGC' \
--conf 'spark.executor.extraJavaOptions=-XX:+PrintGC -XX:+PrintGCDetails -Xloggc:gc.log -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -XX:+PrintHeapAtGC -XX:+PrintReferenceGC' \