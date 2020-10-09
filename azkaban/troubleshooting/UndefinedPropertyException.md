
azkaban.utils.UndefinedPropertyException: Missing required property 'type'
	at azkaban.utils.Props.getString(Props.java:450)
	at azkaban.execapp.FlowRunner.lambda$runExecutableNode$0(FlowRunner.java:918)
	at java.util.Optional.map(Optional.java:215)
	at azkaban.execapp.FlowRunner.runExecutableNode(FlowRunner.java:918)
	at azkaban.execapp.FlowRunner.runReadyJob(FlowRunner.java:630)
	at azkaban.execapp.FlowRunner.runReadyJob(FlowRunner.java:627)
	at azkaban.execapp.FlowRunner.runFlow(FlowRunner.java:429)
	at azkaban.execapp.FlowRunner.run(FlowRunner.java:261)
	at java.util.concurrent.Executors$RunnableAdapter.call(Executors.java:511)
	at java.util.concurrent.FutureTask.run(FutureTask.java:266)
	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
	at java.lang.Thread.run(Thread.java:748)
	


删除原来项目作业
重新上传作业