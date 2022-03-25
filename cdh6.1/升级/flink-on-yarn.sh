
# Make sure your YARN cluster is ready for accepting Flink applications by running yarn top. It should show no error messages.
1.yarn top
2.tar -xzf flink-*.tgz
3.cd flink-* && ls -l
4.export HADOOP_CLASSPATH=`hadoop classpath`


# 提交到yarn，Per-Job Mode
./bin/flink run -t yarn-per-job --detached ./examples/streaming/TopSpeedWindowing.jar

echo "stop" | ./bin/yarn-session.sh -id application_1644606511235_0006
echo "stop" | ./bin/yarn-session.sh -id application_1644606511235_0007



# List running job on the cluster
./bin/flink list -t yarn-per-job -Dyarn.application.id=application_1644606511235_0007

# Cancel running job
./bin/flink cancel -t yarn-per-job -Dyarn.application.id=application_1644606511235_0006 e94f82893dbd96b210c247044a6f16ab