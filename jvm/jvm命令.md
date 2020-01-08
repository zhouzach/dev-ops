
https://www.cnblogs.com/chanshuyi/p/jvm_serial_15_jdk_monitor_command.html

1.虚拟机统计信息：jstat 命令
jstat -gcutil 2365 
  S0     S1     E      O      P     YGC     YGCT    FGC    FGCT     GCT   
  0.00   0.00  12.05   0.00  14.17      0    0.000     0    0.000    0.000
  
  其中每个选项的意义如下：
  
  参数	含义
  S0、S1	表示Survivor0、Survivor1，还未使用。
  E	表示Eden区使用了12.05%的空间。
  O	表示老年代还未使用。
  P	表示永久代使用了14.17%的空间
  YUC、YGCT	表示从程序运行以来一共发生了0次Minor GC（YGC，Young GC），总共耗时0秒。
  FGC、FGCT	表示从程序运行以来一共发生了0次Full GC（FGC，Full GC），总共耗时0秒。
  
  
2.查看线程堆栈：jstack 命令
jstack -l 2618

3.导出堆到文件：jmap 命令
jmap -dump:format=b,file=Desktop/dump.bin 2618
Dumping heap to /Users/yurongchan/Desktop/dump.bin ...
Heap dump file created


4.多功能命令行：jcmd 命令
jcmd 命令可以针对给定的 Java 虚拟机执行一条命令。