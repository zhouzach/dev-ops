
java.lang.RuntimeException: Could not load shims in class org.apache.hadoop.hive.thrift.HadoopThriftAuthBridge23
Caused by: java.lang.ClassNotFoundException: org.apache.hadoop.hive.thrift.HadoopThriftAuthBridge23
/opt/cloudera/parcels/CDH/jars/hive-shims-0.23-1.1.0-cdh5.13.3.jar


java.lang.NoSuchMethodError: com.google.common.collect.Iterators.emptyIterator()Lcom/google/common/collect/UnmodifiableIterator
https://stackoverflow.com/questions/46027107/java-lang-nosuchmethoderror-com-google-common-collect-setssetview-iteratorlc
From experience, this error means that you are bringing an older version of guava earlier in your classpath. Connect worker requires guava >= 20 for org.reflections to work correctly.



java.lang.NoSuchMethodError: com.google.common.base.Preconditions.checkState(ZLjava/lang/String;Ljava/lang/Object;)V
https://stackoverflow.com/questions/49021707/java-lang-nosuchmethoderror-com-google-common-base-preconditions-checkstatezlj?rq=1
update your Guava