
https://blog.csdn.net/kefengwang/article/details/81213014







## 注意新参数必须在 -jar 之前
jar -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005 -jar test.jar    