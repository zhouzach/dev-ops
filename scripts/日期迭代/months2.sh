#!/bin/bash

start=20160101
end=20160301

while [ ${start} -le ${end} ]
do
  echo ${start}

  start=`date -d "1 month ${start}" +%Y%m%d`	# 日期自增
done


