
echo $(date) stop service>>/opt/apps/event.log
ps -ef|grep java |grep app-api|awk  '{print $2}' | xargs kill -9