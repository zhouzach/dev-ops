#!/usr/bin/env bash


 hdfs dfs -rm -r /user/user/sqoop/dashboard/rabbit.users


#删除文件，不进入回收站
 hdfs dfs -rm -r -skipTrash /user/dashboard/rabbit.users

upload_dir="/sqoop/warehouse/${db}.${table}"
if $(hadoop fs -test -d ${upload_dir}) ; then
	hdfs dfs -rm -r ${upload_dir};
	echo "deleted directory: ${upload_dir}";
fi


hadoop fs -mv /user/hadoop/file1 /user/hadoop/file2