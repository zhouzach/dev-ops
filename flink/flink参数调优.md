
https://juejin.im/post/5bfa92f1f265da616301bb72

Checkpoin设置与保存
Flink可以支持保留多个Checkpoint，需要在Flink的配置文件conf/flink-conf.yaml中，添加如下配置，指定最多需要保存Checkpoint的个数。
  state.checkpoints.num-retained: 20
  
