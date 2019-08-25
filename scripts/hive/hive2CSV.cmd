https://www.gchandra.com/hadoop/hive-hadoop/best-way-to-export-hive-table-to-csv-file.html


This post is to explain different options available to export Hive Table (ORC, Parquet or Text) to CSV File.

Expected output : CSV File with comma delimiter and header

Method 1 :

hive -e 'select * from table_orc_data;' | sed 's/[[:space:]]\+/,/g' >  ~/output.cs
Pros : Simple to use, output column header but default output is tab.
Cons : Need to convert Tab delimiter to ‘,’ which could be time consuming when exporting large file.

Method 2:

hadoop fs -cat   hdfs://servername/user/hive/warehouse/databasename/table_csv_export_data/* >  ~/output.csvCopy
Pros : Simple, with comma as delimiter in CSV output.
Cons : No column headers.


Method 3: (My personal favorite)

— Step 3a:
— Create CSV table with dummy header column as first row.

CREATE TABLE table_csv_export_data
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
STORED as textfile
AS
select
'id' as id
,'first_name' as first_name
,'last_name' as last_name
,'join_date' as join_date;Copy
— Step 3b:
— Now insert data actual data into table

INSERT INTO table_csv_export_data
SELECT
    id
    ,first_name
    ,last_name
    ,join_date
FROM
    table_orc_data;Copy
— Step 3c

hadoop fs -cat   hdfs://servername/user/hive/warehouse/databasename/table_csv_export_data/* >  ~/output.csvCopy
Pros : CSV with header columns
Cons : Extra line of script to add header info as row, but final output is quick and as desired.

