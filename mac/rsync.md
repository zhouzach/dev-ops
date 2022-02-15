
bash: rsync: 未找到命令
rsync: connection unexpectedly closed (0 bytes received so far) [sender]
rsync error: error in rsync protocol data stream (code 12) at /AppleInternal/BuildRoot/Library/Caches/com.apple.xbs/Sources/rsync/rsync-54.120.1/rsync/io.c(453) [sender=2.6.9]

远程服务器没有安装rsync
必须使用root用户安装
 yum install -y rsync