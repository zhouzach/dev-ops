
Error:(13, 12) Symbol 'term org.apache.spark.streaming' is missing from the classpath.
This symbol is required by 'value org.apache.hadoop.hbase.spark.HBaseContext.dstream'.
Make sure that term streaming is in your classpath and check for conflicting dependencies with `-Ylog-classpath`.
A full rebuild may help if 'HBaseContext.class' was compiled against an incompatible version of org.apache.spark.

https://www.cnblogs.com/lillcol/p/12192011.html
<dependency>
    <groupId>org.apache.spark</groupId>
    <artifactId>spark-streaming_2.11</artifactId>
    <version>${spark.version}</version>
</dependency>