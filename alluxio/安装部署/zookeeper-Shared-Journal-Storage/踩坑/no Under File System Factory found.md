
ERROR Format - Failed to format
java.lang.IllegalArgumentException: No Under File System Factory found for: hdfs://nameservice1/alluxio/journal/BlockMaster


given that you have run
mvn -T 2C clean install -DskipTests -Dmaven.javadoc.skip -Dfindbugs.skip \
-Dcheckstyle.skip -Dlicense.skip \
-Pufs-hadoop-3 -Dufs.hadoop.version=3.0.0-cdh6.3.1
to build Alluxio,  you are building THE adaptor for HDFS to be cdh 6.3.1.
In this case, you should specify  in alluxio-site.properties
alluxio.master.journal.ufs.option.alluxio.underfs.version=3.0.0-cdh6.3.1
so Alluxio when formatting the journal, knows which HDFS version to use

