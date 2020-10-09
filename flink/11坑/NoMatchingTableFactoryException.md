
>>> Caused by: org.apache.flink.table.api.NoMatchingTableFactoryException:
>>> Could not find a suitable table factory for
>>> 'org.apache.flink.table.factories.TableSourceFactory' in
>>> the classpath.
>>> 
>>> 
>>> Reason: Required context properties mismatch.
这个错误，一般是SQL 程序缺少了SQL connector 或 format的依赖，你pom里下面的这两个依赖，

      <dependency>
           <groupId>org.apache.flink</groupId>
           <artifactId>flink-sql-connector-kafka_2.11</artifactId>
           <version>${flink.version}</version>
       </dependency>
       <dependency>
           <groupId>org.apache.flink</groupId>
           <artifactId>flink-connector-kafka_2.11</artifactId>
           <version>${flink.version}</version>
       </dependency>

放在一起是会冲突的，flink-sql-connector-kafka_2.11 shaded 了kafka的依赖， flink-connector-kafka_2.11 是没有shade的。
你根据你的需要，如果是SQL 程序用第一个， 如果是 dataStream 作业 使用第二个。



org.apache.flink.client.program.ProgramInvocationException: The main method caused an error: findAndCreateTableSink failed.
	at org.apache.flink.client.program.PackagedProgram.callMainMethod(PackagedProgram.java:302)
	at org.apache.flink.client.program.PackagedProgram.invokeInteractiveModeForExecution(PackagedProgram.java:198)
	at org.apache.flink.client.ClientUtils.executeProgram(ClientUtils.java:149)
	at org.apache.flink.client.cli.CliFrontend.executeProgram(CliFrontend.java:699)
	at org.apache.flink.client.cli.CliFrontend.run(CliFrontend.java:232)
	at org.apache.flink.client.cli.CliFrontend.parseParameters(CliFrontend.java:916)
	at org.apache.flink.client.cli.CliFrontend.lambda$main$10(CliFrontend.java:992)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1875)
	at org.apache.flink.runtime.security.contexts.HadoopSecurityContext.runSecured(HadoopSecurityContext.java:41)
	at org.apache.flink.client.cli.CliFrontend.main(CliFrontend.java:992)
Caused by: org.apache.flink.table.api.TableException: findAndCreateTableSink failed.
	at org.apache.flink.table.factories.TableFactoryUtil.findAndCreateTableSink(TableFactoryUtil.java:92)
	at org.apache.flink.table.factories.TableFactoryUtil.lambda$findAndCreateTableSink$0(TableFactoryUtil.java:117)
	at java.util.Optional.orElseGet(Optional.java:267)
	at org.apache.flink.table.factories.TableFactoryUtil.findAndCreateTableSink(TableFactoryUtil.java:117)
	at org.apache.flink.table.planner.delegation.PlannerBase.getTableSink(PlannerBase.scala:336)
	at org.apache.flink.table.planner.delegation.PlannerBase.translateToRel(PlannerBase.scala:204)
	at org.apache.flink.table.planner.delegation.PlannerBase$$anonfun$1.apply(PlannerBase.scala:163)
	at org.apache.flink.table.planner.delegation.PlannerBase$$anonfun$1.apply(PlannerBase.scala:163)
	at scala.collection.TraversableLike$$anonfun$map$1.apply(TraversableLike.scala:234)
	at scala.collection.TraversableLike$$anonfun$map$1.apply(TraversableLike.scala:234)
	at scala.collection.Iterator$class.foreach(Iterator.scala:891)
	at scala.collection.AbstractIterator.foreach(Iterator.scala:1334)
	at scala.collection.IterableLike$class.foreach(IterableLike.scala:72)
	at scala.collection.AbstractIterable.foreach(Iterable.scala:54)
	at scala.collection.TraversableLike$class.map(TraversableLike.scala:234)
	at scala.collection.AbstractTraversable.map(Traversable.scala:104)
	at org.apache.flink.table.planner.delegation.PlannerBase.translate(PlannerBase.scala:163)
	at org.apache.flink.table.api.internal.TableEnvironmentImpl.translate(TableEnvironmentImpl.java:1248)
	at org.apache.flink.table.api.internal.TableEnvironmentImpl.executeInternal(TableEnvironmentImpl.java:694)
	at org.apache.flink.table.api.internal.TableEnvironmentImpl.executeOperation(TableEnvironmentImpl.java:781)
	at org.apache.flink.table.api.internal.TableEnvironmentImpl.executeSql(TableEnvironmentImpl.java:684)
	at cn.ibobei.qile.dataflow.sql.FromKafkaSinkJdbcForUserUV$.main(FromKafkaSinkJdbcForUserUV.scala:108)
	at cn.ibobei.qile.dataflow.sql.FromKafkaSinkJdbcForUserUV.main(FromKafkaSinkJdbcForUserUV.scala)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.apache.flink.client.program.PackagedProgram.callMainMethod(PackagedProgram.java:288)
	... 11 more
Caused by: org.apache.flink.table.api.NoMatchingTableFactoryException: Could not find a suitable table factory for 'org.apache.flink.table.factories.TableSinkFactory' in
the classpath.


下载flink-sql-connector-kafka_2.11-1.11.0.jar，放在/opt/flink-1.11.0/lib