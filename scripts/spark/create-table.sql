-- Creates a partitioned native parquet table
CREATE TABLE data_source_tab1 (col1 INT, p1 INT, p2 INT)
  USING PARQUET PARTITIONED BY (p1, p2)


CREATE TABLE boxes (width INT, length INT, height INT) USING CSV

CREATE TEMPORARY TABLE boxes
  (width INT, length INT, height INT)
  USING PARQUET
  OPTIONS ('compression'='snappy')

CREATE TABLE rectangles
  USING PARQUET
  PARTITIONED BY (width)
  CLUSTERED BY (length) INTO 8 buckets
  AS SELECT * FROM boxes

-- CREATE a HIVE SerDe table using the CREATE TABLE USING syntax.
CREATE TABLE my_table (name STRING, age INT, hair_color STRING)
  USING HIVE
  OPTIONS(
      INPUTFORMAT 'org.apache.hadoop.mapred.SequenceFileInputFormat',
      OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveSequenceFileOutputFormat',
      SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe')
  PARTITIONED BY (hair_color)
  TBLPROPERTIES ('status'='staging', 'owner'='andrew')
-- This command is supported only when Hive support is enabled


CREATE TABLE my_table (name STRING, age INT)

CREATE TABLE my_table (name STRING, age INT)
  COMMENT 'This table is partitioned'
  PARTITIONED BY (hair_color STRING COMMENT 'This is a column comment')
  TBLPROPERTIES ('status'='staging', 'owner'='andrew')

CREATE TABLE my_table (name STRING, age INT)
  COMMENT 'This table specifies a custom SerDe'
  ROW FORMAT SERDE 'org.apache.hadoop.hive.ql.io.orc.OrcSerde'
  STORED AS
      INPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcInputFormat'
      OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.orc.OrcOutputFormat'

CREATE TABLE my_table (name STRING, age INT)
  COMMENT 'This table uses the CSV format'
  ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
  STORED AS TEXTFILE

CREATE TABLE your_table
  COMMENT 'This table is created with existing data'
  AS SELECT * FROM my_table


CREATE EXTERNAL TABLE IF NOT EXISTS my_table (name STRING, age INT)
  COMMENT 'This table is created with existing data'
  LOCATION 'spark-warehouse/tables/my_existing_table'