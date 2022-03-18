#https://cwiki.apache.org/confluence/display/FLUME/Getting+Started
# Think of the avro-client command as cat for Flume.
# For instance, the following creates one event per Linux user and sends it to Flume's avro source on localhost:41414.
bin/flume-ng avro-client --conf conf -H localhost -p 41414 -F /etc/passwd -Dflume.root.logger=DEBUG,console