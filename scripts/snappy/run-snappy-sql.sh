#!/usr/bin/env bash


dir=/data/sql_file
sed -e s/20190322/$2/g s/20190322/$3/g $dir/insert_1.sql > /data/fix_sql_file/$1_insert_1.sql
for file in /data/fix_sql_file/$1_*.sql
do
 	echo $file
 	bash /snappydata-1.0.1-bin/bin/snappy-sql.sh run \
 	-file=$file -client-bind-address=127.0.0.1 \
 	-client-port=1527 \
 	-user=guest \
 	-password=123456 >> $file.result 2>&1
done