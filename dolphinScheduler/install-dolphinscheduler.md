
# To create a user, login as root
useradd dolphinscheduler

# Add password
echo "dolphinscheduler" | passwd --stdin dolphinscheduler

# Configure sudo without password
sed -i '$adolphinscheduler  ALL=(ALL)  NOPASSWD: NOPASSWD: ALL' /etc/sudoers
sed -i 's/Defaults    requirett/#Defaults    requirett/g' /etc/sudoers

# Modify directory permissions and grant permissions for user you created above
chown -R dolphinscheduler:dolphinscheduler apache-dolphinscheduler-*-bin

sudo mkdir /data/app/dolphinscheduler
sudo chown -R dolphinscheduler:dolphinscheduler /data/app/dolphinscheduler/


vim bin/env/install_env.sh
ips=${ips:-"dm-host118,dm-host211,dm-host214"}
masters=${masters:-"dm-host214,dm-host211"}
workers=${workers:-"dm-host211:default,dm-host214:default,dm-host118:default"}
alertServer=${alertServer:-"dm-host118"}
apiServers=${apiServers:-"dm-host214"}
installPath=${installPath:-"/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin"}

scp bin/env/install_env.sh wh1:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/bin/env/
scp bin/env/install_env.sh wh2:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/bin/env/



vim tools/bin/dolphinscheduler_env.sh
export HADOOP_HOME=${HADOOP_HOME:-/opt/cloudera/parcels/CDH/lib/hadoop}
export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-/etc/hadoop/conf}
#export SPARK_HOME1=${SPARK_HOME1:-/opt/soft/spark1}
export SPARK_HOME=${SPARK_HOME:-/opt/cloudera/parcels/CDH/lib/spark}
export SPARK_HOME2=${SPARK_HOME2:-/opt/cloudera/parcels/CDH/lib/spark}
#export PYTHON_HOME=${PYTHON_HOME:-/opt/soft/python}
export JAVA_HOME=${JAVA_HOME:-/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.322.b06-1.el7_9.x86_64}
export HIVE_HOME=${HIVE_HOME:-/opt/cloudera/parcels/CDH/lib/hive}
export FLINK_HOME=${FLINK_HOME:-/data/opt/flink-1.14.3}
export DATAX_HOME=${DATAX_HOME:-/opt/soft/datax}

#export PATH=$HADOOP_HOME/bin:$SPARK_HOME/bin:$PYTHON_HOME/bin:$JAVA_HOME/bin:$HIVE_HOME/bin:$FLINK_HOME/bin:$DATAX_HOME/bin:$PATH
export PATH=$HADOOP_HOME/bin:$SPARK_HOME/bin:$JAVA_HOME/bin:$HIVE_HOME/bin:$FLINK_HOME/bin:$DATAX_HOME/bin:$PATH

export SPRING_JACKSON_TIME_ZONE=${SPRING_JACKSON_TIME_ZONE:-UTC}
export DATABASE=${DATABASE:-mysql}
export SPRING_PROFILES_ACTIVE=${DATABASE}
export SPRING_DATASOURCE_DRIVER_CLASS_NAME=com.mysql.cj.jdbc.Driver
export SPRING_DATASOURCE_URL=jdbc:mysql://192.168.100.16:3306/dolphinscheduler?useUnicode=true&characterEncoding=UTF-8
export SPRING_DATASOURCE_USERNAME=root
export SPRING_DATASOURCE_PASSWORD=123456
export SPRING_CACHE_TYPE=${SPRING_CACHE_TYPE:-none}

export MASTER_FETCH_COMMAND_NUM=${MASTER_FETCH_COMMAND_NUM:-10}

export REGISTRY_TYPE=${REGISTRY_TYPE:-zookeeper}
export REGISTRY_ZOOKEEPER_CONNECT_STRING=${REGISTRY_ZOOKEEPER_CONNECT_STRING:-192.168.100.118:2181,192.168.100.211:2181,192.168.100.214:2181}

cp tools/bin/dolphinscheduler_env.sh master-server/bin/
cp tools/bin/dolphinscheduler_env.sh worker-server/bin/
cp tools/bin/dolphinscheduler_env.sh api-server/bin/
cp tools/bin/dolphinscheduler_env.sh alert-server/bin/
cp tools/bin/dolphinscheduler_env.sh bin/env/

scp tools/bin/dolphinscheduler_env.sh wh1:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/tools/bin/
scp tools/bin/dolphinscheduler_env.sh wh2:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/tools/bin/
wh1:
cp tools/bin/dolphinscheduler_env.sh master-server/bin/
cp tools/bin/dolphinscheduler_env.sh worker-server/bin/
cp tools/bin/dolphinscheduler_env.sh api-server/bin/
cp tools/bin/dolphinscheduler_env.sh alert-server/bin/
cp tools/bin/dolphinscheduler_env.sh bin/env/

wh2:
cp tools/bin/dolphinscheduler_env.sh master-server/bin/
cp tools/bin/dolphinscheduler_env.sh worker-server/bin/
cp tools/bin/dolphinscheduler_env.sh api-server/bin/
cp tools/bin/dolphinscheduler_env.sh alert-server/bin/
cp tools/bin/dolphinscheduler_env.sh bin/env/

vim tools/conf/application.yaml
driver-class-name: com.mysql.cj.jdbc.Driver
url: jdbc:mysql://192.168.100.16:3306/dolphinscheduler?useUnicode=true&characterEncoding=UTF-8&useSSL=false
username: root
password: 123456

vim master-server/conf/application.yaml
driver-class-name: com.mysql.cj.jdbc.Driver
url: jdbc:mysql://192.168.100.16:3306/dolphinscheduler?useUnicode=true&characterEncoding=UTF-8&useSSL=false

vim worker-server/conf/application.yaml
# Override by profile

---
spring:
  config:
    activate:
      on-profile: mysql
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://192.168.100.16:3306/dolphinscheduler?useUnicode=true&characterEncoding=UTF-8&useSSL=false
    username: root
    password: 123456


vim api-server/conf/application.yaml
driver-class-name: com.mysql.cj.jdbc.Driver
url: jdbc:mysql://192.168.100.16:3306/dolphinscheduler?useUnicode=true&characterEncoding=UTF-8&useSSL=false

vim alert-server/conf/application.yaml
driver-class-name: com.mysql.cj.jdbc.Driver
url: jdbc:mysql://192.168.100.16:3306/dolphinscheduler?useUnicode=true&characterEncoding=UTF-8&useSSL=false

scp tools/conf/application.yaml wh1:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/tools/conf/
scp tools/conf/application.yaml wh2:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/tools/conf/

scp master-server/conf/application.yaml wh1:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/master-server/conf/
scp master-server/conf/application.yaml wh2:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/master-server/conf/

scp worker-server/conf/application.yaml wh1:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/worker-server/conf/
scp worker-server/conf/application.yaml wh2:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/worker-server/conf/

scp api-server/conf/application.yaml wh1:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/api-server/conf/
scp api-server/conf/application.yaml wh2:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/api-server/conf/

scp alert-server/conf/application.yaml wh1:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/alert-server/conf/
scp alert-server/conf/application.yaml wh2:/data/opt/apache-dolphinscheduler-3.0.0-alpha-bin/alert-server/conf/

cp tools/libs/mysql-connector-java-8.0.16.jar master-server/libs/
cp tools/libs/mysql-connector-java-8.0.16.jar worker-server/libs/
cp tools/libs/mysql-connector-java-8.0.16.jar api-server/libs/
cp tools/libs/mysql-connector-java-8.0.16.jar alert-server/libs/


scp -r apache-dolphinscheduler-3.0.0-alpha-bin wh1:/data/opt/
chown -R dolphinscheduler:dolphinscheduler apache-dolphinscheduler-3.0.0-alpha-bin/

scp -r apache-dolphinscheduler-3.0.0-alpha-bin wh2:/data/opt/
chown -R dolphinscheduler:dolphinscheduler apache-dolphinscheduler-3.0.0-alpha-bin/

#使用dolphinscheduler用户
sh tools/bin/create-schema.sh

#使用dolphinscheduler用户
sh ./bin/install.sh


/data/app/dolphinscheduler/master-server/logs/dolphinscheduler-master.log
/data/app/dolphinscheduler/worker-server/logs/dolphinscheduler-worker.log
/data/app/dolphinscheduler/alert-server/logs/dolphinscheduler-alert.log
/data/app/dolphinscheduler/api-server/logs/dolphinscheduler-api.log

# Stop all DolphinScheduler server
sh ./bin/stop-all.sh

# Start all DolphinScheduler server
sh ./bin/start-all.sh

# Start or stop DolphinScheduler Master
sh ./bin/dolphinscheduler-daemon.sh stop master-server
sh ./bin/dolphinscheduler-daemon.sh start master-server

# Start or stop DolphinScheduler Worker
sh ./bin/dolphinscheduler-daemon.sh start worker-server
sh ./bin/dolphinscheduler-daemon.sh stop worker-server

# Start or stop DolphinScheduler Api
sh ./bin/dolphinscheduler-daemon.sh start api-server
sh ./bin/dolphinscheduler-daemon.sh stop api-server

# Start or stop Alert
sh ./bin/dolphinscheduler-daemon.sh start alert-server
sh ./bin/dolphinscheduler-daemon.sh stop alert-server
