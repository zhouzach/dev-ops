
Maximum Application Master Attempts (yarn-site.xml)
You have to configure the maximum number of attempts for the application masters for your YARN setup in yarn-site.xml:

<property>
  <name>yarn.resourcemanager.am.max-attempts</name>
  <value>4</value>
  <description>
    The maximum number of application master execution attempts.
  </description>
</property>
The default for current YARN versions is 2 (meaning a single JobManager failure is tolerated).

Application Attempts (flink-conf.yaml)
In addition to the HA configuration (see above), you have to configure the maximum attempts in conf/flink-conf.yaml:

//要小于yarn.resourcemanager.am.max-attempts
yarn.application-attempts: 4 



high-availability: zookeeper
high-availability.zookeeper.quorum: cdh1:2181,cdh2:2181,cdh3:2181
high-availability.storageDir: hdfs:///flink/recovery
high-availability.zookeeper.path.root: /flink
yarn.application-attempts: 4


验证HA，只能用kill -9 YarnApplicationClusterEntryPoint的方式，不能在flink UI cancel或者yarn application -kill的方式
jcmd | grep YarnApplicationClusterEntryPoint | awk '{print $1}' | xargs kill -9


