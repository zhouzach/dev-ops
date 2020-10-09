

1.tar xvf hbase-2.1.0-bin.tar.gz
2.mv hbase-2.1.0 /usr/local/opt
3.vim conf/hbase-env.sh
export JAVA_HOME=`/usr/libexec/java_home`

sudo ./bin/start-hbase.sh
sudo ./bin/stop-hbase.sh

http://localhost:16010/