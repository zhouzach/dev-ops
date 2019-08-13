
-- parquet
CREATE EXTERNAL TABLE IF NOT EXISTS db1.tb1 (
order_id	        string,
order_time	        string,
price	        decimal(30,2)
)
COMMENT 'partitioned table'
PARTITIONED BY(year INT, month INT, day INT)
STORED AS parquet
LOCATION '/data/db1/tb1'


CREATE EXTERNAL TABLE db1.t1
(id bigint, name STRING, age STRING)
STORED AS PARQUET LOCATION '/user/snappy/db1/t1/';

load data inpath '/user/snappy/db1/t1/part-00000-920105fb-0f0e-441e-b30b-4aab8b18e03c.snappy.parquet' into table db1.t1;

-- https://www.cloudera.com/documentation/enterprise/5-3-x/topics/cdh_ig_parquet.html#parquet_hive


-- csv
https://docs.hortonworks.com/HDPDocuments/HDP3/HDP-3.1.0/using-hiveql/content/hive_create_an_external_table.html
students.csv
1,jane,doe,senior,mathematics
2,john,smith,junior,engineering

CREATE EXTERNAL TABLE IF NOT EXISTS names_text(
  student_ID INT, FirstName STRING, LastName STRING,
  year STRING, Major STRING)
  COMMENT 'Student Names'
  ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  STORED AS TEXTFILE
  LOCATION '/user/andrena';



