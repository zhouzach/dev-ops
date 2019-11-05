cd /opt/apps/app-service
echo $(date) update source>>/opt/apps/event.log
git pull
cd /opt/apps/commands
sh build.sh
sleep 1
sh restart.sh