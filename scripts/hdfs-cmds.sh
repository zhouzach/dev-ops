#!/usr/bin/env bash


 hdfs dfs -rm -r /user/user/sqoop/dashboard/rabbit.users


#删除文件，不进入回收站
 hdfs dfs -rm -r -skipTrash /user/dashboard/rabbit.users
