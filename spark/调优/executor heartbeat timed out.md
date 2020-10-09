
Executor heartbeat timed out after X ms

https://stackoverflow.com/questions/54036028/spark-executor-heartbeat-timed-out-after-x-ms

df.repartition(1000)


--conf spark.network.timeout 10000000 
--conf spark.executor.heartbeatInterval=10000000   
--conf spark.driver.maxResultSize=4g 