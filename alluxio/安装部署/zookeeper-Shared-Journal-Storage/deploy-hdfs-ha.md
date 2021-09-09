
https://docs.alluxio.io/os/user/stable/en/operation/Journal.html#configuring-ufs-journal


./bin/alluxio fs mount \
--option alluxio.underfs.version=3.0 \
/mnt/hdfs hdfs://nameservice1:8020/