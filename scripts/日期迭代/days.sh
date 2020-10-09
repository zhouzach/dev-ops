#! /bin/bash

start='2016-01-01'
end='2016-01-03'
end=`date -d "1 day ${end}" +%Y-%m-%d`	# 包含end

while [ "${start}" != "${end}" ]
do
  echo ${start}
  start=`date -d "1 day ${start}" +%Y-%m-%d`	# 日期自增
done