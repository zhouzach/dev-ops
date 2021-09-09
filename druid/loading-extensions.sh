
# All of these community extensions can be downloaded using pull-deps
# while specifying a -c coordinate option to pull org.apache.druid.extensions.contrib:{EXTENSION_NAME}:{DRUID_VERSION}.

java \
  -cp "lib/*" \
  -Ddruid.extensions.directory="extensions" \
  -Ddruid.extensions.hadoopDependenciesDir="hadoop-dependencies" \
  org.apache.druid.cli.Main tools pull-deps \
  --no-default-hadoop \
  --clean \
  -c "org.apache.druid.extensions:druid-kafka-indexing-service:0.19.0"

java \
  -cp "lib/*" \
  -Dorg.apache.logging.log4j.simplelog.StatusLogger.level=TRACE \
  -Ddruid.extensions.directory="extensions" \
  -Ddruid.extensions.hadoopDependenciesDir="hadoop-dependencies" \
  org.apache.druid.cli.Main tools pull-deps \
  -c "org.apache.druid.extensions:druid-hdfs-storage:0.19.0"
  -h org.apache.hadoop:hadoop-client:3.0.0