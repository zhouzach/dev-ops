
sudo -u hdfs hive -e "ALTER TABLE banban.bill ADD PARTITION (year=2020,month=2) LOCATION '/data/ods/db/bill_202002/';"