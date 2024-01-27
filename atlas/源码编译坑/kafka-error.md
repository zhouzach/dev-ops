ERROR metrics.Metrics: Error when registering metric on org.apache.kafka.common.metrics.JmxReporter
java.security.AccessControlException: access denied ("javax.management.MBeanTrustPermission" "register")
at java.security.AccessControlContext.checkPermission(AccessControlContext.java:472)
at java.lang.SecurityManager.checkPermission(SecurityManager.java:585)
at com.sun.jmx.interceptor.DefaultMBeanServerInterceptor.checkMBeanTrustPermission(DefaultMBeanServerInterceptor.java:1848)
at com.sun.jmx.interceptor.DefaultMBeanServerInterceptor.registerMBean(DefaultMBeanServerInterceptor.java:322)
at com.sun.jmx.mbeanserver.JmxMBeanServer.registerMBean(JmxMBeanServer.java:522)
at org.apache.kafka.common.metrics.JmxReporter.reregister(JmxReporter.java:167)
at org.apache.kafka.common.metrics.JmxReporter.metricChange(JmxReporter.java:85)
at org.apache.kafka.common.metrics.Metrics.registerMetric(Metrics.java:568)
at org.apache.kafka.common.metrics.Metrics.addMetric(Metrics.java:507)
at org.apache.kafka.common.metrics.Metrics.addMetric(Metrics.java:490)
at org.apache.kafka.common.metrics.Metrics.addMetric(Metrics.java:475)
at org.apache.kafka.common.metrics.Metrics.<init>(Metrics.java:156)
at org.apache.kafka.common.metrics.Metrics.<init>(Metrics.java:122)
at org.apache.kafka.clients.producer.KafkaProducer.<init>(KafkaProducer.java:357)
at org.apache.kafka.clients.producer.KafkaProducer.<init>(KafkaProducer.java:299)
at org.apache.atlas.kafka.KafkaNotification.getOrCreateProducer(KafkaNotification.java:356)
at org.apache.atlas.kafka.KafkaNotification.sendInternal(KafkaNotification.java:262)
at org.apache.atlas.notification.AbstractNotification.send(AbstractNotification.java:93)
at org.apache.atlas.hook.AtlasHook.notifyEntitiesInternal(AtlasHook.java:202)
at org.apache.atlas.hook.AtlasHook$2.run(AtlasHook.java:170)
at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)
at java.util.concurrent.FutureTask.run(FutureTask.java:266)
at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
at java.lang.Thread.run(Thread.java:750)


https://www.freesion.com/article/45701353391/
https://blog.csdn.net/weixin_33778544/article/details/91867953
https://blog.csdn.net/tom_fans/article/details/85726467
vim /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.322.b06-1.el7_9.x86_64/jre/lib/security/java.policy
#permission java.security.AllPermission;
permission javax.management.MBeanTrustPermission "register";