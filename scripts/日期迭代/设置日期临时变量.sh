
# https://stackoverflow.com/questions/2371248/how-to-convert-timestamps-to-dates-in-bash

select_sql="SELECT start_time from config"
start_time=`mysql -h ${MYSQL_GAME_HOST} -P${MYSQL_GAME_PORT} -u${MYSQL_GAME_USER} -p${MYSQL_GAME_PASSWORD} -D${MYSQL_GAME_DATABASE} -e "${select_sql}" | awk 'NR==2{print}'`

activity_time=`date -d @$start_time | awk '{print $1 $2 $3}'`
now_time=`date | awk '{print $1 $2 $3}'`