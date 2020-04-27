#!/bin/bash

start=20160101
end=20160103

while [ ${start} -le ${end} ]
do
  echo ${start}
  start=`date -d "1 day ${start}" +%Y%m%d`	# 日期自增
done















start=201601
end=201603

while [ ${start} -le ${end} ]
do
  ss=`date -s "$start" +%Y%m`
  echo $ss
  start=`date -d "1 day ${start}" +%Y%m%d`	# 日期自增
done





start=201601
end=201601

while [ ${start} -le ${end} ]
do
  echo ${start}
  #start=`date -d "1 day ${start}" +%Y%m%d`	# 日期自增


  start=`date -d "$(date -s "$start" +%Y%m) +${n} month " +'%Y-%m'`
done
