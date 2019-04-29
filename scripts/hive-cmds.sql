
CREATE EXTERNAL TABLE db1.t1
(id bigint, name STRING, age STRING)
STORED AS PARQUET LOCATION '/user/snappy/db1/t1/';


load data inpath '/user/snappy/db1/t1/part-00000-920105fb-0f0e-441e-b30b-4aab8b18e03c.snappy.parquet' into table db1.t1;