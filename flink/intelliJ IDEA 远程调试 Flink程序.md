
https://blog.csdn.net/chenyulancn/article/details/104511292

Flink 集群开启调试功能
在文件　flink-conf.yaml　添加两行配置：

# jobmanager debug端口
env.java.opts.jobmanager: "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5006"
# taskmanager debug端口
env.java.opts.taskmanager: "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
idea配置
１　配置remote：



如上图所示，点击Edit Configurations，进入如下界面：



如上图所示，我们进入了Run/Debug Configurations界面，然后点击左上角的+，选择Remote：



标注 1：名称，自定；
标注 2：调试模式，默认为Attach；
标注 3：传输方式，默认为Socket；
标注 4：服务端 IP 地址，默认为localhost，修改为对应flink集群运行的 IP 地址；
标注 5：服务器端口号，默认为5005，修改为flink集群任务端口5006，参见flink集群debug配置；
标注 6：使用默认即可，其中端口号根据标注５的值自动更新。
标注 ７：对应发布的module名称。

补充说明：
如上图所示，其中 标注 2 和 标注 3 又分别有两种分类，对于 标注 2

标注 ２：调试模式，默认为Attach；
Attach：此种模式下，调试服务端（被调试远程运行的机器）启动一个端口等待我们（调试客户端）去连接；
Listen： 此种模式下，是我们（调试客户端）去监听一个端口，当调试服务端准备好了，就会进行连接。

２　设置完成后，点击Debug按钮运行，如果连接成功，则会出现如下提示：




idea端操作
在需要调试的源码加上断点，等候操作

flink集群操作
在集群端提交运行要调试的任务（与要调试的源码与jar最好一致，否则容易错位）

线程并行调试设置
　如调试时,不想影响其他线程,可在断点上右键,勾上Thread选项即可,这样就不会阻塞．

