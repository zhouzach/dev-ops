
ps -ef|grep 'app'|head -n 1|awk '{print $2}' | xargs kill