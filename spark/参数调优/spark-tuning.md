
https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/admin_hos_tuning.html#concept_dml_dry_y5
https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/cdh_ig_running_spark_on_yarn.html#spark_on_yarn_dynamic_allocation

To minimize the number of unused cores, Cloudera recommends setting spark.executor.cores to 4, 5, or 6, 
depending on the number of cores allocated for YARN.


The total memory allocated to an executor includes spark.executor.memory and spark.yarn.executor.memoryOverhead

Make sure the sum of spark.yarn.executor.memoryOverhead and spark.executor.memory is less than yarn.scheduler.maximum-allocation-mb.


spark.driver.memory=10.5gb
spark.yarn.driver.memoryOverhead=1.5gb