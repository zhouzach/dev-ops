Exception in thread "main" java.lang.NoSuchMethodError: org.apache.commons.cli.Option.builder(Ljava/lang/String;)Lorg/apache/commons/cli/Option$Builder;
at org.apache.flink.runtime.entrypoint.parser.CommandLineOptions.<clinit>(CommandLineOptions.java:27)
at org.apache.flink.runtime.entrypoint.EntrypointClusterConfigurationParserFactory.getOptions(EntrypointClusterConfigurationParserFactory.java:43)
at org.apache.flink.runtime.entrypoint.parser.CommandLineParser.parse(CommandLineParser.java:42)
at org.apache.flink.runtime.entrypoint.ClusterEntrypointUtils.parseParametersOrExit(ClusterEntrypointUtils.java:64)
at org.apache.flink.runtime.entrypoint.StandaloneSessionClusterEntrypoint.main(StandaloneSessionClusterEntrypoint.java:50)


https://blog.csdn.net/wmpisadba/article/details/117952310
https://blog.csdn.net/momentni/article/details/114637659
