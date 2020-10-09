#! /bin/bash

start='2016-01-01'
end='2016-03-01'
end=`date -d "1 month ${end}" +%Y-%m-%d`	# 包含end

while [ "${start}" != "${end}" ]
do
  echo "start: ${start}"
  echo "end: ${end}"
  start=`date -d "1 month ${start}" +%Y-%m-%d`	# 日期自增
done



