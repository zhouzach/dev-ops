
mysql -u root -p123456 < ./init_db/create-grant.sql



mysql -h192.168.100.2 -uroot -p123456 -P13306 -Dnacos < ./nacos-mysql.sql

# 导入初始化SQL
> source conf/canal_manager.sql