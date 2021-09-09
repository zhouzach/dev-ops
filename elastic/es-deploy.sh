
./bin/elasticsearch -E http.port=9601 -E transport.tcp.port=9501 -E network.host=0.0.0.0 -E cluster.initial_master_nodes=node101 -E node.master=true -E node.data=true  -E node.name=node101 -E cluster.name=big-data -E path.data=/home/zach/data/elastic/node101 -E path.logs=/home/zach/log/elastic/node101 -d
./bin/elasticsearch -E http.port=9602 -E transport.tcp.port=9502 -E network.host=0.0.0.0 -E cluster.initial_master_nodes=node101 -E node.master=false -E node.data=true -E node.name=node102 -E cluster.name=big-data -E path.data=/home/zach/data/elastic/node102 -E path.logs=/home/zach/log/elastic/node102 -d


http://localhost:9202/


kill elasticsearch




mac:
./bin/elasticsearch -E http.port=9200 -E node.name=node1 -E node.master=true -E cluster.name=big-data -E path.data=/Users/Zach/data/elastic/node1 -E path.logs=/Users/Zach/logs/elastic/node1 -d
./bin/elasticsearch -E http.port=9201 -E node.name=node2 -E node.master=false -E cluster.name=big-data -E path.data=/Users/Zach/data/elastic/node2 -E path.logs=/Users/Zach/logs/elastic/node2 -d
./bin/elasticsearch -E http.port=9202 -E node.name=node3 -E node.master=false -E cluster.name=big-data -E path.data=/Users/Zach/data/elastic/node3 -E path.logs=/Users/Zach/logs/elastic/node3 -d