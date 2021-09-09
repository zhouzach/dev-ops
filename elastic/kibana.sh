
vim config/kibana.yml

# To allow connections from remote users, set this parameter to a non-loopback address.
server.host: "192.168.1.70"

# The URLs of the Elasticsearch instances to use for all your queries.
elasticsearch.hosts: ["http://192.168.1.70:9601"]

./bin/kibana




localhost:5601