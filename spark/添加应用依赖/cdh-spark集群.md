
https://docs.cloudera.com/documentation/enterprise/latest/topics/phoenix_spark_connector.html

Go to the Spark service.
Click the Configuration tab.
Select Scope > Gateway.
Select Category > Advanced.
Locate the Spark Client Advanced Configuration Snippet (Safety Valve) for spark-conf/spark-defaults.conf property or search for it by typing its name in the Search box.
Add the following properties to ensure that all required Phoenix and HBase platform dependencies are available on the classpath for the Spark executors and drivers:
Phoenix client JARs:

spark.executor.extraClassPath=phoenix-<version>-client.jar
spark.driver.extraClassPath=phoenix-<version>-client.jar
Phoenix-Spark JARs:

spark.executor.extraClassPath=phoenix-spark-<version>.jar
spark.driver.extraClassPath=phoenix-spark-<version>.jar
Enter a Reason for change, and then click Save Changes to commit the changes.
Restart the role and service when Cloudera Manager prompts you to restart.
