
sudo -u hdfs hive -e "LOAD DATA INPATH '/data/ods/db/bill_202002/5158927b-3486-4ada-96a8-514f3d29d5d5.parquet' OVERWRITE INTO TABLE db.bill PARTITION (year=2020,month=2);"