22/04/08 10:59:38 ERROR hook.HiveHook: HiveHook.run(): failed to process operation CREATETABLE
java.lang.NoSuchMethodError: org.apache.hadoop.hive.metastore.api.Database.getCatalogName()Ljava/lang/String;
at org.apache.atlas.hive.bridge.HiveMetaStoreBridge.getDatabaseName(HiveMetaStoreBridge.java:618)
at org.apache.atlas.hive.hook.AtlasHiveHookContext.getQualifiedName(AtlasHiveHookContext.java:207)
at org.apache.atlas.hive.hook.AtlasHiveHookContext.init(AtlasHiveHookContext.java:303)
at org.apache.atlas.hive.hook.AtlasHiveHookContext.<init>(AtlasHiveHookContext.java:85)
at org.apache.atlas.hive.hook.AtlasHiveHookContext.<init>(AtlasHiveHookContext.java:65)
at org.apache.atlas.hive.hook.HiveHook.run(HiveHook.java:188)
at org.apache.hadoop.hive.ql.Driver.execute(Driver.java:1960)
at org.apache.hadoop.hive.ql.Driver.runInternal(Driver.java:1563)
at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1339)
at org.apache.hadoop.hive.ql.Driver.run(Driver.java:1328)
at org.apache.hadoop.hive.cli.CliDriver.processLocalCmd(CliDriver.java:239)
at org.apache.hadoop.hive.cli.CliDriver.processCmd(CliDriver.java:187)
at org.apache.hadoop.hive.cli.CliDriver.processLine(CliDriver.java:409)
at org.apache.hadoop.hive.cli.CliDriver.processLine(CliDriver.java:342)
at org.apache.hadoop.hive.cli.CliDriver.processReader(CliDriver.java:487)
at org.apache.hadoop.hive.cli.CliDriver.processFile(CliDriver.java:503)
at org.apache.hadoop.hive.cli.CliDriver.executeDriver(CliDriver.java:806)
at org.apache.hadoop.hive.cli.CliDriver.run(CliDriver.java:772)
at org.apache.hadoop.hive.cli.CliDriver.main(CliDriver.java:699)
at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
at java.lang.reflect.Method.invoke(Method.java:498)
at org.apache.sqoop.hive.HiveImport.executeScript(HiveImport.java:280)
at org.apache.sqoop.hive.HiveImport.importTable(HiveImport.java:216)
at org.apache.sqoop.hive.HiveImport.importTable(HiveImport.java:374)
at org.apache.sqoop.tool.ImportTool.importTable(ImportTool.java:549)
at org.apache.sqoop.tool.ImportTool.run(ImportTool.java:633)
at org.apache.sqoop.Sqoop.run(Sqoop.java:146)
at org.apache.hadoop.util.ToolRunner.run(ToolRunner.java:76)
at org.apache.sqoop.Sqoop.runSqoop(Sqoop.java:182)
at org.apache.sqoop.Sqoop.runTool(Sqoop.java:233)
at org.apache.sqoop.Sqoop.runTool(Sqoop.java:242)
at org.apache.sqoop.Sqoop.main(Sqoop.java:251)



https://jiezhi.github.io/2020/08/18/atlas2-hive-hook-error/
cd addons/hive-bridge
mvn clean -DskipTests package -Pdist
scp target/hive-bridge-2.2.0.jar root@192.168.100.118:/data/opt/apache-atlas-2.2.0/hook/hive/atlas-hive-plugin-impl/

scp target/hive-bridge-2.1.0.jar root@192.168.100.118:/data/opt/apache-atlas-2.1.0/hook/hive/atlas-hive-plugin-impl/
