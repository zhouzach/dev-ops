
start_day=`date -d "-1 day ${begin_day}" +%Y%m%d`
stop_day=`date -d "-1 day ${end_day}" +%Y%m%d`
sql="DELETE from family_user_consumption_detail WHERE created_at BETWEEN ${start_day} and ${stop_day}"

mysql -h ${MYSQL_REPORT_HOST} -u${MYSQL_REPORT_USER} -p${MYSQL_REPORT_PASSWORD} -D${MYSQL_REPORT_DATABASE} -e "${sql}"