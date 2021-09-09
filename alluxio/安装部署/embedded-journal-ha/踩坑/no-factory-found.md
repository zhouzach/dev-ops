
2021-01-04 14:51:50,124 ERROR Format - Failed to format
java.lang.IllegalArgumentException: No Under File System Factory found for: hdfs://nameservice1/alluxio/journal/BlockMaster
at alluxio.underfs.UnderFileSystem$Factory.create(UnderFileSystem.java:95)


vim conf/alluxio-site.properties
alluxio.master.journal.folder=/mnt/ramdisk/alluxioworker