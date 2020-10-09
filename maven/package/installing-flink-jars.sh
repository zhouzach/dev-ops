
#mvn install:install-file -Dfile=/Users/Zach/flink/flink-connectors/flink-hbase/target/flink-hbase_2.11-1.10-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-hbase_2.11 -Dversion=1.10-SNAPSHOT -Dpackaging=jar
#
#mvn install:install-file -Dfile=/Users/Zach/jars/hbase-client-2.1.0-cdh6.3.1.jar  -DgroupId=org.apache.hbase -DartifactId=hbase-client -Dversion=2.1.0-cdh6.3.1 -Dpackaging=jar
#
#mvn install:install-file -Dfile=/Users/Zach/jars/flink/flink-shaded-hadoop-2-3.0.0-cdh6.3.0-7.0.jar  -DgroupId=org.apache.flink -DartifactId=flink-shaded-hadoop-2 -Dversion=3.0.0-cdh6.3.0-7.0 -Dpackaging=jar


#mvn org.apache.maven.plugins:maven-install-plugin:2.5.2:install-file -Dfile=/Users/Zach/apache-flink/flink-java/target/flink-java-1.11-SNAPSHOT.jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-streaming-java/target/flink-streaming-java_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-streaming-java_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-scala/target/flink-scala_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-scala_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-connectors/flink-connector-jdbc/target/flink-connector-jdbc_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-jdbc_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-streaming-scala/target/flink-streaming-scala_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-streaming-scala_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-table/flink-table-common/target/flink-table-common-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-table-common -Dversion=1.11-SNAPSHOT -Dpackaging=jar

mvn install:install-file -Dfile=/Users/Zach/dev-apps/flink/flink-connectors/flink-connector-jdbc/target/flink-connector-jdbc_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-connector-jdbc_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-connectors/flink-connector-hbase/target/flink-connector-hbase_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-connector-hbase_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-connectors/flink-sql-connector-kafka/target/flink-sql-connector-kafka_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-sql-connector-kafka_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-connectors/flink-connector-kafka/target/flink-connector-kafka_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-connector-kafka_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-formats/flink-avro/target/flink-avro-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-avro -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-connectors/flink-connector-hive/target/flink-connector-hive_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-connector-hive_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-table/flink-table-api-java/target/flink-table-api-java-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-table-api-java -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-table/flink-table-api-java-bridge/target/flink-table-api-java-bridge_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-table-api-java-bridge_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-table/flink-table-api-scala/target/flink-table-api-scala_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-table-api-scala_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-table/flink-table-api-scala-bridge/target/flink-table-api-scala-bridge_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-table-api-scala-bridge_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-formats/flink-csv/target/flink-csv-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-csv -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-formats/flink-json/target/flink-json-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-json -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-table/flink-table-planner/target/flink-table-planner_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-table-planner_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar
#mvn install:install-file -Dfile=/Users/Zach/apache-flink/flink-table/flink-table-planner-blink/target/flink-table-planner-blink_2.11-1.11-SNAPSHOT.jar -DgroupId=org.apache.flink -DartifactId=flink-table-planner-blink_2.11 -Dversion=1.11-SNAPSHOT -Dpackaging=jar

