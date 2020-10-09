
https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL

sudo -u hdfs hive -e "ALTER TABLE db.bill ADD PARTITION (year=2020,month=2) LOCATION '/data/ods/db/bill_202002/';"

sudo -u hdfs hive -e "ALTER TABLE db.bill DROP PARTITION (year=2020, month=3);"