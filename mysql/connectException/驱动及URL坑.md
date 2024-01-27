
https://www.cnblogs.com/liaojie970/p/8916568.html

com.mysql.jdbc.Driver 是 mysql-connector-java 5中的，
com.mysql.cj.jdbc.Driver 是 mysql-connector-java 6中的



JDBC连接Mysql6 com.mysql.cj.jdbc.Driver， 需要指定时区serverTimezone


可以选择东8区的Hongkong、Asia/Shanghai或者Asia/Hongkong作为参数，修改后url为
jdbc:mysql://172.xx.xx.xx:3306/test?useUnicode=true&characterEncoding=gbk&useSSL=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=Hongkong 