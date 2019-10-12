
cd /opt/apps/app-service
mvn -Dhttp.proxyHost=10.12.14.15 -Dhttp.proxyPort=8080 -P base clean package -Dmaven.skip.test=true -pl app-api -am
cp -rf /opt/apps/app-service/app-api/target/app-api.jar /opt/apps/app-backend
echo $(date) build and copy >>/opt/apps/event.log