
--  https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-Add/ReplaceColumns

--  hive.exec.dynamic.partition needs to be set to true to enable dynamic partitioning with ALTER PARTITION
SET hive.exec.dynamic.partition = true;

--  This will alter all existing partitions in the table with ds='2008-04-08' -- be sure you know what you are doing!
ALTER TABLE foo PARTITION (ds='2008-04-08', hr) CHANGE COLUMN dec_column_name dec_column_name DECIMAL(38,18);

ALTER TABLE social_gift PARTITION (year=2020, month=6) ADD COLUMNS (unionbonus decimal(16,2) COMMENT '家族长抽成');

-- RESTRICT is the default, limiting column changes only to table metadata
ALTER TABLE table_name ADD COLUMNS (result_credit decimal(20,3)) RESTRICT;

-- ALTER TABLE ADD|REPLACE COLUMNS with CASCADE command changes the columns of a table's metadata,
-- and cascades the same change to all the partition metadata
ALTER TABLE table_name ADD COLUMNS (result_credit decimal(20,3)) CASCADE;