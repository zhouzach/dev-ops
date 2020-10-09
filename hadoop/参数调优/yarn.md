
https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/cdh_ig_yarn_tuning.html#concept_vbk_m43_fr

https://docs.cloudera.com/documentation/enterprise/6/6.3/topics/admin_hos_tuning.html#concept_dml_dry_y5

Most commonly, only YARN NodeManager and HDFS DataNode services are running on worker hosts.

### Configuring Cores
Allocate 1 core for each of the services and 2 additional cores for OS usage, leaving cores available for YARN.

### Configuring Memory
Allocate 20 GB memory for these services and processes. To do so, set yarn.nodemanager.resource.memory-mb=100 GB and yarn.nodemanager.resource.cpu-vcores=28

