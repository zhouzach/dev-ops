#!/bin/bash

#https://sqoop.apache.org/docs/1.4.7/SqoopUserGuide.html#_importing_data_into_hive

#Set table name here
TABLE_NAME=your_schema.your_table

#generate map from existing table
MAP_COLUMN_HIVE=$(hive -S -e "set hive.cli.print.header=false; describe ${TABLE_NAME};" | awk -F " " 'f&&!NF{exit}{f=1}f{printf c toupper($1) "=" toupper($2)}{c=","}')

#call sqoop with --map-column-hive parameter
#add other sqoop params
sqoop import [your sqoop params here] --map-column-hive "$MAP_COLUMN_HIVE" [more sqoop params]