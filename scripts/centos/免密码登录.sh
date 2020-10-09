
#首先要配置itcast01到itcast02、itcast03的免密码登陆
#在itcast01上生产一对钥匙
ssh-keygen -t rsa

#将公钥拷贝到其他节点，包括自己#####此命令会将自己的公钥复制到目标主机的~/.ssh/authorized_keys，
# 如果在公有云中，会覆盖其他主机的公钥文件
ssh-copy-id kafka01
ssh-copy-id kafka02
ssh-copy-id kafka03
ssh-copy-id hbase01
ssh-copy-id hbase02
ssh-copy-id hbase03
ssh-copy-id hbase04
ssh-copy-id hbase05
