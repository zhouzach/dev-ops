
https://docs.alluxio.io/ee/user/stable/en/operation/Troubleshooting.html#q-why-do-i-see-exceptions-like-no-filesystem-for-scheme-alluxio


Please make sure your HDFS configuration file core-site.xml (in your default hadoop installation or spark/conf/ if you customize this file for Spark) has the following property:

<configuration>
  <property>
    <name>fs.alluxio.impl</name>
    <value>alluxio.hadoop.FileSystem</value>
  </property>
</configuration>