
https://www.modb.pro/db/196903#35_CDHHBASE_476
https://atlas.apache.org/#/HookHive

1.Set-up Atlas hook in hive-site.xml by adding the following:
vim /etc/hive/conf/hive-site.xml
<property>
<name>hive.exec.post.hooks</name>
<value>org.apache.atlas.hive.hook.HiveHook</value>
</property>

scp /etc/hive/conf/hive-site.xml wh2:/etc/hive/conf/

2.
scp distro/target/apache-atlas-2.2.0-hive-hook.tar.gz root@192.168.100.118:/data/opt
tar -xzvf apache-atlas-2.2.0-hive-hook.tar.gz
cp -r apache-atlas-hive-hook-2.2.0/hook/hive apache-atlas-2.2.0/hook/
scp -r apache-atlas-hive-hook-2.2.0/hook/hive wh2:/data/opt/apache-atlas-2.2.0/hook/

3.
vim /etc/hive/conf/hive-env.sh
export HIVE_AUX_JARS_PATH=/data/opt/apache-atlas-2.2.0/hook/hive:$HIVE_AUX_JARS_PATH

scp /etc/hive/conf/hive-env.sh wh2:/etc/hive/conf/

4.
cp apache-atlas-2.2.0/conf/atlas-application.properties /etc/hive/conf/
scp /etc/hive/conf/atlas-application.properties wh2:/etc/hive/conf




验证：
CREATE TABLE t_ppp  (
id int ,
pice decimal(2, 1)
) ;

insert into t_ppp values (1,2.2);

CREATE TABLE t_ppp_bak  (
id int ,
pice decimal(2, 1)
) ;

insert overwrite table t_ppp_bak select id,pice from t_ppp;

CREATE VIEW  IF NOT EXISTS t_ppp_view AS SELECT id,pice FROM t_ppp_bak;

