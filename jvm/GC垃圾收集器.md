
https://blog.csdn.net/leo187/article/details/88920036

因为为java语言提供支持的虚拟机有很多，不同虚拟机提供的垃圾收集器差别很大。这里讨论的收集器基于JDK1.7 Update14之后的HotSpot虚拟机。这个虚拟机包含的所有垃圾收集器如下图在这里插入图片描述

参数解析
XX:+UseSerialGC
使用串行回收器进行回收，这个参数会使新生代和老年代都使用串行回收器，新生代使用复制算法，老年代使用标记-整理算法。Serial收集器是最基本、历史最悠久的收集器，它是一个单线程收集器。一旦回收器开始运行时，整个系统都要停止。Client模式下默认开启，其他模式默认关闭。

-XX:+UseParNewGC
Parallel是并行的意思，ParNew收集器是Serial收集器的多线程版本，使用这个参数后会在新生代进行并行回收，老年代仍旧使用串行回收。新生代S区任然使用复制算法。操作系统是多核CPU上效果明显，单核CPU建议使用串行回收器。打印GC详情时ParNew标识着使用了ParNewGC回收器。默认关闭。

[GC[ParNew: 78656K->8703K(78656K), 0.0180555 secs] 81048K->17429K(253440K), 0.0187828 secs] [Times: user=0.03 sys=0.00, real=0.02 secs]
1
-XX:+UseParallelGC
代表新生代使用Parallel收集器，老年代使用串行收集器。Parallel Scavenge收集器在各个方面都很类似ParNew收集器，它的目的是达到一个可以控制的吞吐量。吞吐量为CPU用于运行用户代码的时间与CPU总消耗时间的比值，即吞吐量=运行用户代码时间/（运行用户代码时间+垃圾收集时间），虚拟机运行100分钟，垃圾收集花费1分钟，那吞吐量就99%。Server模式默认开启，其他模式默认关闭。
Parallel Scavenge提供了两个参数用于控制吞吐量，-XX:MaxGCPauseMillis参数用于设置最大停顿时间，它的参数运行值是一个大于0的毫秒数，收集器将尽力保证垃圾回收时间不超过设定值，系统运行的需要回收的垃圾总量是固定的，缩短停顿时间的同时会增大回收频度。-XX:GCTimeRatio参数用户控制垃圾回收时间占比，它运行的参数值是0-100的整数，如果参数设置为19，代表最大GC时间占总时间的5%（1/(1+19)）。
Parallel收集器还提供了自适应的调节策略-XX:UseAdaptiveSizePolicy，即JVM会根据实际运行情况动态调整新生代大小、新生代和s区比例、晋升老年代对象大小等细节参数。
-XX:+UseParallelOldGC
新生代和老年代都使用并行收集器。打印出的GC会带PSYoungGen、ParOldGen关键字。
[Full GC [PSYoungGen: 4032K->0K(145920K)] [ParOldGen: 164500K->138362K(246272K)] 168532K->138362K(392192K) [PSPermGen: 67896K->67879K(136192K)], 1.006
1
-XX:+UseConcMarkSweepGC
Concurrent Mark Sweep 并发标记清除，即使用CMS收集器。它是和应用程序线程一起执行，相对于Stop The World来说虚拟机停顿时间较少。停顿减少，吞吐量会降低。它使用的是 标记清除算法，运作过程为四个步骤，分别是 初始标记—并发标识—重新标记—并发清除。它是老年代的收集算法，新生代使用ParNew收集算法。默认关闭
CMS收集器的缺点是对服务器CPU资源较为敏感，在并发标记时会降低吞吐量。它使用的标记清除算法也会产生大量空间碎片，空间碎片的存在会加大Full GC的频率，虽然老年代还有足够的内存，但是因为内存空间连续，不得不进行Full GC。
-XX:+ UseCMSCompactAtFullCollection
Full GC后，进行一次整理，整理过程是独占的，会引起停顿时间变长。仅在使用CMS收集器时生效。
-XX:ParallelCMSThreads
设置并行GC时进行内存回收的线程数量
-XX:PreternureSizeThreshold
直接晋升老年代的对象大小，设置了这个参数后，大于这个参数的对象直接在老年代进行分配。
-XX:MaxTenuringThreshold
晋升老年代的对象年龄，对象在每一次Minor GC后年龄增加一岁，超过这个值后进入到老年代。默认值为15。
-XX:NativeMemoryTracking=detail
使用命令jcmd pid VM.native_memory detail，配合查看JVM相关情况