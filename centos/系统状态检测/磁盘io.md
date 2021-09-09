
Iostat 是 sysstat 工具集的一个工具，需要安装。
yum install sysstat
iostat -dx 显示磁盘扩展信息

root@fileapp:~# iostat -dx

r/s 和 w/s 分别是每秒的读操作和写操作，而rKB/s 和wKB/s 列以每秒千字节为单位显示了读和写的数据量

如果这两对数据值都很高的话说明磁盘io操作是很频繁。