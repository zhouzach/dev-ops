
# https://www.docs4dev.com/docs/zh/apache-hive/3.1.1/reference/StatsDev.html
# https://cwiki.apache.org/confluence/display/Hive/StatsDev
hive -e "ANALYZE TABLE db1.t1 COMPUTE STATISTICS NOSCAN;"

hive -e "ANALYZE TABLE dwd.${table} PARTITION(year=${YEAR}, month=${MONTH2}) COMPUTE STATISTICS;"

hive -e "ANALYZE TABLE dwd.${table} PARTITION(year=${YEAR}, month=${MONTH2}) COMPUTE STATISTICS;"
