
https://tech.youzan.com/presto-zai-you-zan-de-shi-jian-zhi-lu/

2.2 Presto 执行查询过程
Client 发送请求给 Coordinator。
SQL 通过 ANTLR 进行解析生成 AST。
AST 通过元数据进行语义解析。
语义解析后的数据生成逻辑执行计划，并且通过规则进行优化。
切分逻辑执行计划为不同 Stage，并调度 Worker 节点去生成 Task。
Task 生成相应物理执行计划。
调度完后根据调度结果 Coordinator 将 Stage 串联起来。
Worker 执行相应的物理执行计划。
Client 不断地向 Coordinator 拉取查询结果，Coordinator 从最终汇聚输出的 Worker 节点拉取查询结果。

2.3 Presto 为何高性能
Pipeline, 全内存计算。
SQL 查询计划规则优化。
动态代码生成技术。
数据调度本地化，注重内存开销效率，优化数据结构，Cache，非精确查询等其它技术。
