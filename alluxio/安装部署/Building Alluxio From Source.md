
https://docs.alluxio.io/os/user/stable/en/contributor/Building-Alluxio-From-Source.html

mvn -T 2C clean install -DskipTests -Dmaven.javadoc.skip -Dfindbugs.skip \
-Dcheckstyle.skip -Dlicense.skip \
-Pufs-hadoop-3 -Dufs.hadoop.version=3.0.0-cdh6.3.1
-Pufs-hadoop-3 -Dufs.hadoop.version=3.0.0
