
java.io.FileNotFoundException: File file:/user/spark/applicationHistory does not exist
	at org.apache.hadoop.fs.RawLocalFileSystem.deprecatedGetFileStatus(RawLocalFileSystem.java:641)
	at org.apache.hadoop.fs.RawLocalFileSystem.getFileLinkStatusInternal(RawLocalFileSystem.java:867)
	at org.apache.hadoop.fs.RawLocalFileSystem.getFileStatus(RawLocalFileSystem.java:631)
	at org.apache.hadoop.fs.FilterFileSystem.getFileStatus(FilterFileSystem.java:442)
	at org.apache.spark.scheduler.EventLoggingListener.start(EventLoggingListener.scala:103)
	at org.apache.spark.SparkContext.<init>(SparkContext.scala:533)
	at org.apache.spark.SparkContext$.getOrCreate(SparkContext.scala:2549)
	at org.apache.spark.sql.SparkSession$Builder$$anonfun$7.apply(SparkSession.scala:944)
	at org.apache.spark.sql.SparkSession$Builder$$anonfun$7.apply(SparkSession.scala:935)
	at scala.Option.getOrElse(Option.scala:121)
	at org.apache.spark.sql.SparkSession$Builder.getOrCreate(SparkSession.scala:935)
	at org.rabbit.phoenix.PhoenixSparkHelper$.saveToPhoenixByDataFrame(PhoenixSparkHelper.scala:107)
	at org.rabbit.phoenix.PhoenixSparkHelper$.main(PhoenixSparkHelper.scala:31)
	at org.rabbit.phoenix.PhoenixSparkHelper.main(PhoenixSparkHelper.scala)
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
	
