



GRANT ALL ON dashboard.* TO 'root'@'%' IDENTIFIED BY '123456';
-- reload 是 administrative 级的权限，即 server administration；这类权限包括：
-- CREATE USER, PROCESS, RELOAD, REPLICATION CLIENT, REPLICATION SLAVE, SHOW DATABASES, SHUTDOWN, SUPER
-- 这类权限的授权不是针对某个数据库的，因此须使用on *.* 来进行：
GRANT RELOAD ON *.* TO 'root'@'%';
GRANT SUPER ON *.* TO 'root'@'%';
GRANT REPLICATION CLIENT ON *.* TO 'root'@'%';
GRANT REPLICATION SLAVE ON *.* TO 'root'@'%';
flush privileges;


-- 授权远程登录
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;
FLUSH PRIVILEGES;