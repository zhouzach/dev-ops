
java.lang.AssertionError: assertion failed: sink name should must be defined
at scala.Predef$.assert(Predef.scala:170)
at org.apache.griffin.measure.configuration.dqdefinition.SinkParam.validate(EnvConfig.scala:110)
at org.apache.griffin.measure.configuration.dqdefinition.EnvConfig$$anonfun$validate$2.apply(EnvConfig.scala:48)
at org.apache.griffin.measure.configuration.dqdefinition.EnvConfig$$anonfun$validate$2.apply(EnvConfig.scala:48)
at scala.collection.immutable.List.foreach(List.scala:392)
at org.apache.griffin.measure.configuration.dqdefinition.EnvConfig.validate(EnvConfig.scala:48)
at org.apache.griffin.measure.configuration.dqdefinition.reader.ParamReader$class.validate(ParamReader.scala:43)
at org.apache.griffin.measure.configuration.dqdefinition.reader.ParamFileReader.validate(ParamFileReader.scala:33)
at org.apache.griffin.measure.configuration.dqdefinition.reader.ParamFileReader$$anonfun$readConfig$1.apply(ParamFileReader.scala:40)
at org.apache.griffin.measure.configuration.dqdefinition.reader.ParamFileReader$$anonfun$readConfig$1.apply(ParamFileReader.scala:36)
at scala.util.Try$.apply(Try.scala:192)
at org.apache.griffin.measure.configuration.dqdefinition.reader.ParamFileReader.readConfig(ParamFileReader.scala:36)
at org.apache.griffin.measure.Application$.readParamFile(Application.scala:127)
at org.apache.griffin.measure.Application$.main(Application.scala:55)
at org.apache.griffin.measure.Application.main(Application.scala)
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


https://blog.csdn.net/weixin_43160819/article/details/118298681