#!/bin/bash

today=`date +%Y-%m-%d`    # equal to: today=`date +%F`
echo $today



# mac can not run, but linux can run

start=`date -d "2016-01-01" +%Y%m%d`   # 格式化起止日期为20160101
start_sec=`date -d "2016-01-01" +%s`   # 格式化日期20160101自UTC 时间 1970-01-01 00:00:00 以来所经过的秒数
firstDay=`date +%Y-%m-01`


yesterday1=`date --date="1 days ago" +%Y-%m-%d`
yesterday2=`date -d "-1 day" +%Y-%m-%d`

plusDay1=`date -d "1 day 20160101" +%Y-%m-%d`
plusDay2=`date -d "1 day 2016-01-01" +%Y-%m-%d`

last_month=`date -d "$(date +%Y-%m-01) -1 month " +%Y-%m-%d`

month_day=`date -d "$(date +%Y-%m-01) -${n} month +1 month -1 day" +%Y-%m-%d`

day=`date -d "@1451577600" +%Y-%m-%d`   # Convert seconds since the epoch (1970-01-01 UTC) to a date
