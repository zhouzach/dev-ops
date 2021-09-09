
--- Printing the log tail for /opt/alluxio-2.4.1-1/logs/worker.log
>>> BEGIN
2021-01-04 15:05:29,300 ERROR AlluxioWorker - Fatal error: Failed to create worker process
java.lang.RuntimeException: java.util.concurrent.ExecutionException: java.lang.IllegalStateException: ramfs is smaller than the configured size: ramfs size: 20.17GB, configured size: 20.84GB
at alluxio.worker.AlluxioWorkerProcess.<init>(AlluxioWorkerProcess.java:168)
at alluxio.worker.WorkerProcess$Factory.create(WorkerProcess.java:46)
at alluxio.worker.WorkerProcess$Factory.create(WorkerProcess.java:38)
at alluxio.worker.AlluxioWorker.main(AlluxioWorker.java:72)
Caused by: java.util.concurrent.ExecutionException: java.lang.IllegalStateException: ramfs is smaller than the configured size: ramfs size: 20.17GB, configured size: 20.84GB
at java.util.concurrent.FutureTask.report(FutureTask.java:122)
at java.util.concurrent.FutureTask.get(FutureTask.java:192)
at alluxio.util.CommonUtils.invokeAll(CommonUtils.java:592)
at alluxio.util.CommonUtils.invokeAll(CommonUtils.java:554)
at alluxio.worker.AlluxioWorkerProcess.<init>(AlluxioWorkerProcess.java:118)
... 3 more
Caused by: java.lang.IllegalStateException: ramfs is smaller than the configured size: ramfs size: 20.17GB, configured size: 20.84GB
at alluxio.worker.block.meta.StorageTier.checkEnoughMemSpace(StorageTier.java:176)
at alluxio.worker.block.meta.StorageTier.initStorageTier(StorageTier.java:129)
at alluxio.worker.block.meta.StorageTier.newStorageTier(StorageTier.java:200)
at alluxio.worker.block.BlockMetadataManager.<init>(BlockMetadataManager.java:78)
at alluxio.worker.block.BlockMetadataManager.createBlockMetadataManager(BlockMetadataManager.java:114)
at alluxio.worker.block.TieredBlockStore.<init>(TieredBlockStore.java:119)
at alluxio.worker.block.DefaultBlockWorker.<init>(DefaultBlockWorker.java:132)
at alluxio.worker.block.BlockWorkerFactory.create(BlockWorkerFactory.java:43)
at alluxio.worker.block.BlockWorkerFactory.create(BlockWorkerFactory.java:26)
at alluxio.worker.AlluxioWorkerProcess.lambda$new$0(AlluxioWorkerProcess.java:110)
at java.util.concurrent.FutureTask.run(FutureTask.java:266)
at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)
at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
at java.lang.Thread.run(Thread.java:748)

2021-01-04 15:06:11,117 INFO  NettyUtils - EPOLL_MODE is available
<<< EOF


vim conf/alluxio-site.properties
alluxio.worker.tieredstore.level0.dirs.quota=10GB
alluxio.worker.tieredstore.level1.dirs.quota
alluxio.worker.tieredstore.level2.dirs.quota
