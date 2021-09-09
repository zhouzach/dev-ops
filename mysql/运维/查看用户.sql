
select * from mysql.user;

CREATE USER 'druid'@'localhost' IDENTIFIED BY 'diurd';
drop user 'druid'@'localhost';
flush privileges;