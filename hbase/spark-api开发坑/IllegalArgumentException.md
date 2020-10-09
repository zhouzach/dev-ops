
Exception in thread "main" java.lang.IllegalArgumentException: Can not create a Path from a null string
	at org.apache.hadoop.fs.Path.checkPathArg(Path.java:164)
	at org.apache.hadoop.fs.Path.<init>(Path.java:180)
	at org.apache.hadoop.fs.Path.<init>(Path.java:115)
	at org.apache.hadoop.hbase.mapreduce.HFileOutputFormat2.configurePartitioner(HFileOutputFormat2.java:591)
	at org.apache.hadoop.hbase.mapreduce.HFileOutputFormat2.configureIncrementalLoad(HFileOutputFormat2.java:440)
	at org.apache.hadoop.hbase.mapreduce.HFileOutputFormat2.configureIncrementalLoad(HFileOutputFormat2.java:405)
	at org.apache.hadoop.hbase.mapreduce.HFileOutputFormat2.configureIncrementalLoad(HFileOutputFormat2.java:386)
	at org.rabbit.spark.SparkWriteHBaseByHFile$.insertWithBulkLoadWithMulti(SparkWriteHBaseByHFile.scala:53)
	at org.rabbit.spark.SparkWriteHBaseByHFile$.main(SparkWriteHBaseByHFile.scala:24)
	at org.rabbit.spark.SparkWriteHBaseByHFile.main(SparkWriteHBaseByHFile.scala)
	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	at java.lang.reflect.Method.invoke(Method.java:498)
	at org.apache.spark.deploy.JavaMainApplication.start(SparkApplication.scala:52)
	at org.apache.spark.deploy.SparkSubmit.org$apache$spark$deploy$SparkSubmit$$runMain(SparkSubmit.scala:851)
	at org.apache.spark.deploy.SparkSubmit.doRunMain$1(SparkSubmit.scala:167)
	at org.apache.spark.deploy.SparkSubmit.submit(SparkSubmit.scala:195)
	at org.apache.spark.deploy.SparkSubmit.doSubmit(SparkSubmit.scala:86)
	at org.apache.spark.deploy.SparkSubmit$$anon$2.doSubmit(SparkSubmit.scala:926)
	at org.apache.spark.deploy.SparkSubmit$.main(SparkSubmit.scala:935)
	at org.apache.spark.deploy.SparkSubmit.main(SparkSubmit.scala)
	

https://blog.csdn.net/weixin_39588015/article/details/79050087	
hbaseConf.set("hbase.fs.tmp.dir", "/tmp")