
java.lang.NullPointerException
	at org.json.JSONObject.<init>(JSONObject.java:144)
	at org.apache.sqoop.util.SqoopJsonUtil.getJsonStringforMap(SqoopJsonUtil.java:43)
	at org.apache.sqoop.SqoopOptions.writeProperties(SqoopOptions.java:867)
	at org.apache.sqoop.mapreduce.JobBase.putSqoopOptionsToConfiguration(JobBase.java:393)
	at org.apache.sqoop.mapreduce.JobBase.createJob(JobBase.java:379)
	at org.apache.sqoop.mapreduce.ImportJobBase.runImport(ImportJobBase.java:255)
	at org.apache.sqoop.manager.SqlManager.importTable(SqlManager.java:691)
	at org.apache.sqoop.manager.MySQLManager.importTable(MySQLManager.java:124)
	at org.apache.sqoop.tool.ImportTool.importTable(ImportTool.java:534)
	at org.apache.sqoop.tool.ImportTool.run(ImportTool.java:633)
	at org.apache.sqoop.Sqoop.run(Sqoop.java:146)
	at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:76)
	at org.apache.sqoop.Sqoop.runSqoop(Sqoop.java:182)
	at org.apache.sqoop.Sqoop.runTool(Sqoop.java:233)
	at org.apache.sqoop.Sqoop.runTool(Sqoop.java:242)
	at org.apache.sqoop.Sqoop.main(Sqoop.java:251)
	
https://www.e-learn.cn/topic/1046134
https://www.codetd.com/en/article/6341064

下载java-json.jar，放到
/opt/cloudera/parcels/CDH/lib/sqoop/lib