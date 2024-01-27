
# 是否启用binlog日志
show variables like 'log_bin';
# 查看binlog类型
show global variables like 'binlog_format';
# 查看详细的日志配置信息
show global variables like '%log%';
# mysql数据存储目录
show variables like '%dir%';
# 查看binlog的目录
show global variables like "%log_bin%";
# 查看当前服务器使用的biglog文件及大小
show binary logs;
# 查看最新一个binlog日志文件名称和Position
show master status;