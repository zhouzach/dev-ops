
SemanticException [Error 10096]: Dynamic partition strict mode requires at least one static partition column. To turn this off set hive.exec.dynamic.partition.mode=nonstrict

1.In Cloudera Manager > Clusters select the Hive service. Click Configuration, and search for hive-site.xml
2.In Hive 客户端高级配置代码段 (Safety Valve) for hive-site.xml, click + and add the hive.exec.dynamic.partition.mode property.
3.Set the value to nonstrict.
4.Save the changes and restart the Hive service




