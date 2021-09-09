
ps -U root -u root u


USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0 191052  3832 ?        Ss    2020  68:23 /usr/lib/systemd/systemd --system --deserialize 21
root         2  0.0  0.0      0     0 ?        S     2020   0:00 [kthreadd]
root         3  0.0  0.0      0     0 ?        S     2020   2:10 [ksoftirqd/0]
root         5  0.0  0.0      0     0 ?        S<    2020   0:00 [kworker/0:0H]
root         7  0.0  0.0      0     0 ?        S     2020   1:32 [migration/0]
root         8  0.0  0.0      0     0 ?        S     2020   0:00 [rcu_bh]
root         9  0.0  0.0      0     0 ?        S     2020 196:56 [rcu_sched]
root        10  0.0  0.0      0     0 ?        S     2020   1:20 [watchdog/0]


ps -U root -u root u | grep 24439
root     10251  0.0  0.0 112728   972 pts/6    S+   12:55   0:00 grep --color=auto 24439
root     24439  0.0  1.1 12371448 379840 ?     Sl   2月18   5:17 /usr/bin/java -cp /opt/alluxio-2.4.1-1/conf/::/opt/alluxio-2.4.1-1/assembly/alluxio-server-2.4.1-1.jar -Dalluxio.home=/opt/alluxio-2.4.1-1 -Dalluxio.conf.dir=/opt/alluxio-2.4.1-1/conf -Dalluxio.logs.dir=/opt/alluxio-2.4.1-1/logs -Dalluxio.user.logs.dir=/opt/alluxio-2.4.1-1/logs/user -Dlog4j.configuration=file:/opt/alluxio-2.4.1-1/conf/log4j.properties -Dorg.apache.jasper.compiler.disablejsr199=true -Djava.net.preferIPv4Stack=true -Dorg.apache.ratis.thirdparty.io.netty.allocator.useCacheForAllThreads=false -Dalluxio.logger.type=MASTER_LOGGER -Dalluxio.master.audit.logger.type=MASTER_AUDIT_LOGGER -Xmx8g -XX:MetaspaceSize=256M alluxio.master.AlluxioMaster