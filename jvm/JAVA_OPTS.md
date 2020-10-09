
JAVA_OPTS ="- server -Xms2048m -Xmx2048m -Xss512k"

-server：一定要作为第一个参数，在多个CPU时性能佳
-Xms：初始堆大小，使用的最小内存，cpu性能高时此值应设的大一些
-Xmx：Java  heap最大值
-XX:Newratio:  设置Yong 和 Old的比例，比如值为2，则Old Generation是 Yong Generation的2倍，
                即Yong Generation占据内存的1/3
-XX:Newsize : 设置Yong Generation的初始值大小
-XX:Maxnewsize：设置Yong Generation的最大值大小
-XX:Surviorratio : 设置Eden和一个Suivior的比例，比如值为5，即Eden是To(S2)的比例是5，（From和To是一样大的），
                    此时Eden占据Yong Generation的5/7
一般情况下，不允许-XX:Newratio值小于1，即Old要比Yong大。


HADOOP_OPTS="$HADOOP_OPTS -XX:NewRatio=12 -Xmx12288m -Xms12288m -XX:MaxHeapFreeRatio=40 -XX:MinHeapFreeRatio=15 -XX:+UseParNewGC -XX:-UseGCOverheadLimit"

-XX:+UseParNewGC 
-XX:+UseConcMarkSweepGC 
-XX:CMSInitiatingOccupancyFraction=70 
-XX:+CMSParallelRemarkEnabled

-XX:MetaspaceSize=512M
-XX:MaxMetaspaceSize=512M
-XX:-UseGCOverheadLimit