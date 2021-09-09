
20/11/06 17:12:58 INFO util.PhoenixMRJobUtil: Attempt to get running/submitted jobs information from RM URL = http://null:8088/ws/v1/cluster/apps?states=NEW,ACCEPTED,SUBMITTED,RUNNING
Exception in thread "main" java.net.UnknownHostException: null
	at java.net.AbstractPlainSocketImpl.connect(AbstractPlainSocketImpl.java:184)
	at java.net.SocksSocketImpl.connect(SocksSocketImpl.java:392)
	at java.net.Socket.connect(Socket.java:589)
	at sun.net.NetworkClient.doConnect(NetworkClient.java:175)
	at sun.net.www.http.HttpClient.openServer(HttpClient.java:463)
	at sun.net.www.http.HttpClient.openServer(HttpClient.java:558)
	at sun.net.www.http.HttpClient.<init>(HttpClient.java:242)
	at sun.net.www.http.HttpClient.New(HttpClient.java:339)
	at sun.net.www.http.HttpClient.New(HttpClient.java:357)
	at sun.net.www.protocol.http.HttpURLConnection.getNewHttpClient(HttpURLConnection.java:1220)
	at sun.net.www.protocol.http.HttpURLConnection.plainConnect0(HttpURLConnection.java:1156)
	at sun.net.www.protocol.http.HttpURLConnection.plainConnect(HttpURLConnection.java:1050)
	at sun.net.www.protocol.http.HttpURLConnection.connect(HttpURLConnection.java:984)
	at sun.net.www.protocol.http.HttpURLConnection.getInputStream0(HttpURLConnection.java:1564)
	at sun.net.www.protocol.http.HttpURLConnection.getInputStream(HttpURLConnection.java:1492)
	at org.apache.phoenix.util.PhoenixMRJobUtil.getJobsInformationFromRM(PhoenixMRJobUtil.java:153)
	at org.apache.phoenix.mapreduce.index.automation.PhoenixMRJobSubmitter.getSubmittedYarnApps(PhoenixMRJobSubmitter.java:306)
	at org.apache.phoenix.mapreduce.index.automation.PhoenixMRJobSubmitter.scheduleIndexBuilds(PhoenixMRJobSubmitter.java:245)
	at org.apache.phoenix.mapreduce.index.automation.PhoenixMRJobSubmitter.main(PhoenixMRJobSubmitter.java:334)
	
	
添加yarn-site.xml到HBASE_CLASSPATH_PREFIX	
HBASE_CLASSPATH_PREFIX=/etc/hadoop/conf/yarn-site.xml:/opt/cloudera/parcels/CDH/lib/hbase/lib/htrace-core-3.1.0-incubating.jar:/opt/cloudera/parcels/CDH/jars/commons-cli-1.4.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-zookeeper-0.8.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/twill-discovery-api-0.8.0.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/joda-time-2.9.9.jar:/opt/cloudera/parcels/PHOENIX/lib/phoenix/lib/antlr-runtime-3.4.jar:/etc/hbase/conf \
hbase org.apache.phoenix.mapreduce.index.automation.PhoenixMRJobSubmitter