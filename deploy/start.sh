echo $(date) start service>>/opt/apps/event.log
DEBUG="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=20000"
nohup java -jar -Dspring.profiles.active=prod $DEBUG -Dspring.jpa.properties.hibernate.show_sql=true /opt/apps/app-backend/app-api.jar &>> /opt/apps/runtime.log   &