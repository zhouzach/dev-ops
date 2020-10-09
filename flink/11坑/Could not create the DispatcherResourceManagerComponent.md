
org.apache.flink.util.FlinkException: Could not create the DispatcherResourceManagerComponent
Caused by: org.apache.flink.util.FlinkException: Could not create the DispatcherResourceManagerComponent.
	at org.apache.flink.runtime.entrypoint.component.AbstractDispatcherResourceManagerComponentFactory.create(AbstractDispatcherResourceManagerComponentFactory.java:257)
	at org.apache.flink.runtime.entrypoint.ClusterEntrypoint.runCluster(ClusterEntrypoint.java:210)
	at org.apache.flink.runtime.entrypoint.ClusterEntrypoint.lambda$startCluster$0(ClusterEntrypoint.java:164)
	at java.security.AccessController.doPrivileged(Native Method)
	at javax.security.auth.Subject.doAs(Subject.java:422)
	at org.apache.hadoop.security.UserGroupInformation.doAs(UserGroupInformation.java:1875)
	at org.apache.flink.runtime.security.HadoopSecurityContext.runSecured(HadoopSecurityContext.java:41)
	at org.apache.flink.runtime.entrypoint.ClusterEntrypoint.startCluster(ClusterEntrypoint.java:163)
	... 2 more
Caused by: java.net.BindException: Could not start rest endpoint on any port in port range 8081
	at org.apache.flink.runtime.rest.RestServerEndpoint.start(RestServerEndpoint.java:219)
	
	资源不足，有可能cpu不够