
Exception in thread "main" java.lang.NoSuchMethodError: org.apache.atlas.ApplicationProperties.get()Lcom/hortonworks/spark/atlas/shade/org/apache/commons/configuration/Configuration;
at com.hortonworks.spark.atlas.AtlasClientConf.configuration$lzycompute(AtlasClientConf.scala:25)
at com.hortonworks.spark.atlas.AtlasClientConf.configuration(AtlasClientConf.scala:25)
at com.hortonworks.spark.atlas.AtlasClientConf.get(AtlasClientConf.scala:50)
at com.hortonworks.spark.atlas.AtlasClient$.atlasClient(AtlasClient.scala:120)
at com.hortonworks.spark.atlas.SparkAtlasEventTracker.<init>(SparkAtlasEventTracker.scala:33)
at com.hortonworks.spark.atlas.SparkAtlasEventTracker.<init>(SparkAtlasEventTracker.scala:37)
at sun.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
at sun.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
at sun.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
at java.lang.reflect.Constructor.newInstance(Constructor.java:423)
at org.apache.spark.util.Utils$$anonfun$loadExtensions$1.apply(Utils.scala:2743)
at org.apache.spark.util.Utils$$anonfun$loadExtensions$1.apply(Utils.scala:2732)
at scala.collection.TraversableLike$$anonfun$flatMap$1.apply(TraversableLike.scala:241)
at scala.collection.TraversableLike$$anonfun$flatMap$1.apply(TraversableLike.scala:241)
at scala.collection.mutable.ResizableArray$class.foreach(ResizableArray.scala:59)
at scala.collection.mutable.ArrayBuffer.foreach(ArrayBuffer.scala:48)
at scala.collection.TraversableLike$class.flatMap(TraversableLike.scala:241)
at scala.collection.AbstractTraversable.flatMap(Traversable.scala:104)
at org.apache.spark.util.Utils$.loadExtensions(Utils.scala:2732)
at org.apache.spark.SparkContext$$anonfun$setupAndStartListenerBus$1.apply(SparkContext.scala:2407)
at org.apache.spark.SparkContext$$anonfun$setupAndStartListenerBus$1.apply(SparkContext.scala:2406)
at scala.Option.foreach(Option.scala:257)
at org.apache.spark.SparkContext.setupAndStartListenerBus(SparkContext.scala:2406)
at org.apache.spark.SparkContext.<init>(SparkContext.scala:566)
at org.apache.spark.SparkContext$.getOrCreate(SparkContext.scala:2549)
at org.apache.spark.sql.SparkSession$Builder$$anonfun$7.apply(SparkSession.scala:944)
at org.apache.spark.sql.SparkSession$Builder$$anonfun$7.apply(SparkSession.scala:935)
at scala.Option.getOrElse(Option.scala:121)
at org.apache.spark.sql.SparkSession$Builder.getOrCreate(SparkSession.scala:935)



spark-atlas-connector-assembly-0.1.0-SNAPSHOT.jar
换成
spark-atlas-connector_2.11-0.1.0-SNAPSHOT.jar

