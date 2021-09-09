
org.apache.phoenix.schema.TableNotFoundException: ERROR 1012 (42M03): Table undefined. tableName=ODS.USER_FLINK8
	at org.apache.phoenix.schema.PMetaDataImpl.getTableRef(PMetaDataImpl.java:71)
	at org.apache.phoenix.jdbc.PhoenixConnection.getTable(PhoenixConnection.java:583)
	at org.apache.phoenix.mapreduce.util.PhoenixConfigurationUtil.getStatsForParallelizationProp(PhoenixConfigurationUtil.java:648)
	at org.apache.phoenix.iterate.BaseResultIterators.<init>(BaseResultIterators.java:504)
	at org.apache.phoenix.iterate.ParallelIterators.<init>(ParallelIterators.java:62)
	at org.apache.phoenix.iterate.ParallelIterators.<init>(ParallelIterators.java:69)
	at org.apache.phoenix.execute.AggregatePlan.newIterator(AggregatePlan.java:273)
	at org.apache.phoenix.execute.BaseQueryPlan.iterator(BaseQueryPlan.java:364)
	at org.apache.phoenix.execute.BaseQueryPlan.iterator(BaseQueryPlan.java:217)
	at org.apache.phoenix.execute.BaseQueryPlan.iterator(BaseQueryPlan.java:212)
	at org.apache.phoenix.execute.BaseQueryPlan.iterator(BaseQueryPlan.java:207)
	at org.apache.phoenix.jdbc.PhoenixStatement$1.call(PhoenixStatement.java:312)
	at org.apache.phoenix.jdbc.PhoenixStatement$1.call(PhoenixStatement.java:291)
	at org.apache.phoenix.call.CallRunner.run(CallRunner.java:53)
	at org.apache.phoenix.jdbc.PhoenixStatement.executeQuery(PhoenixStatement.java:290)
	at org.apache.phoenix.jdbc.PhoenixStatement.executeQuery(PhoenixStatement.java:283)
	at org.apache.phoenix.jdbc.PhoenixStatement.execute(PhoenixStatement.java:1830)
	at sqlline.Commands.execute(Commands.java:822)
	at sqlline.Commands.sql(Commands.java:732)
	at sqlline.SqlLine.dispatch(SqlLine.java:813)
	at sqlline.SqlLine.begin(SqlLine.java:686)
	at sqlline.SqlLine.start(SqlLine.java:398)
	at sqlline.SqlLine.main(SqlLine.java:291)

namespace needs to be created via HBase APIs because "CREATE SCHEMA" statement tries to write
its metadata in SYSTEM:CATALOG table. Without SYSTEM namespace, SYSTEM:CATALOG table cannot be created
即：
1.现在hbase中创建
create_namespace 'ODS'
2.在phoenix中，
create schema ODS;
3.然后在创建表和索引表
