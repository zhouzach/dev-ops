
1.
Set-up Atlas hook in <sqoop-conf>/sqoop-site.xml by adding the following:
<property>
<name>sqoop.job.data.publish.class</name>
<value>org.apache.atlas.sqoop.hook.SqoopHook</value>
</property>


scp /etc/sqoop/conf/sqoop-site.xml wh2:/etc/sqoop/conf/


2.
scp distro/target/apache-atlas-2.1.0-sqoop-hook.tar.gz root@192.168.100.118:/data/opt
tar -zxvf apache-atlas-2.1.0-sqoop-hook.tar.gz
cd apache-atlas-sqoop-hook-${project.version}
cp -r /data/opt/apache-atlas-sqoop-hook-2.1.0/hook/sqoop /data/opt/apache-atlas-2.1.0/hook

scp ~/Downloads/commons-configuration-1.10.jar root@192.168.100.118:/data/opt/apache-atlas-2.1.0/hook/sqoop
scp /data/opt/apache-atlas-2.1.0/hook/sqoop/commons-configuration-1.10.jar wh1:/data/opt/apache-atlas-2.1.0/hook/sqoop/

scp -r /data/opt/apache-atlas-2.1.0/hook/sqoop wh2:/data/opt/apache-atlas-2.1.0/hook


3.cp /data/opt/apache-atlas-2.1.0/conf/atlas-application.properties /etc/sqoop/conf/
scp /etc/sqoop/conf/atlas-application.properties wh2:/etc/sqoop/conf/

4.
ln -s /data/opt/apache-atlas-2.1.0/hook/sqoop/commons-configuration-1.10.jar /opt/cloudera/parcels/CDH/lib/sqoop/lib/
ln -s /data/opt/apache-atlas-2.1.0/hook/sqoop/*.jar /opt/cloudera/parcels/CDH/lib/sqoop/lib/
ln -s /data/opt/apache-atlas-2.1.0/hook/sqoop/atlas-sqoop-plugin-impl/*.jar /opt/cloudera/parcels/CDH/lib/sqoop/lib/

ln -s /data/opt/apache-atlas-2.1.0/hook/sqoop/*.jar /data/opt/sqoop-1.4.7.bin__hadoop-2.6.0/lib
ln -s /data/opt/apache-atlas-2.1.0/hook/sqoop/atlas-sqoop-plugin-impl/*.jar /data/opt/sqoop-1.4.7.bin__hadoop-2.6.0/lib




scp ~/Downloads/commons-configuration-1.10.jar root@192.168.100.118:/data/opt/apache-atlas-2.1.0/hook/sqoop
scp /data/opt/apache-atlas-2.1.0/hook/sqoop/commons-configuration-1.10.jar wh3:/data/opt/apache-atlas-2.1.0/hook/sqoop/
