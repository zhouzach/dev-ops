
-- https://www.coder.work/article/732002

-- hbase.columns.mapping中注意在hbase的二进制类型的column后面使用#b

create table user_hbase10
(
    rowkey       string,
    sex          string,
    age          int,
    created_time string
)
    stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
        WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf:sex,cf:age#b,cf:created_time#b")
    TBLPROPERTIES ("hbase.table.name" = "user_hbase10");



create EXTERNAL table ods.user_hbase19
(
    `rowkey`     string,
    `uid`        bigint,
    sex          string,
    age          int,
    created_time string
)
    stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
        WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf:uid#b,cf:sex,cf:age#b,cf:created_time")
    TBLPROPERTIES ("hbase.table.name" = "ods:user_hbase19");

create table user_hbase8
(
    rowkey       string,
    sex          string,
    age          int,
    created_time string
)
    stored by 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
        WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key,cf:sex,cf:age#b,cf:created_time#b")
    TBLPROPERTIES ("hbase.table.name" = "ods:user_hbase8");