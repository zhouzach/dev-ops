
sh /opt/apps/commands/stop.sh
sleep 1
sh /opt/apps/commands/start.sh
tail -f -n 100 /opt/apps/runtime.log