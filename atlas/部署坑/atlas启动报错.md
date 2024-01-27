Caused by: java.lang.RuntimeException: Error encountered in creating/updating request handler /freetext for collection vertex_index
at org.apache.atlas.repository.graphdb.janus.AtlasJanusGraphIndexClient.applySearchWeight(AtlasJanusGraphIndexClient.java:135)
at org.apache.atlas.repository.graph.SolrIndexHelper.onChange(SolrIndexHelper.java:87)
at org.apache.atlas.repository.graph.SolrIndexHelper.onInitCompletion(SolrIndexHelper.java:106)
at org.apache.atlas.repository.graph.GraphBackedSearchIndexer.notifyInitializationCompletion(GraphBackedSearchIndexer.java:1012)
... 62 more
Caused by: org.apache.solr.client.solrj.SolrServerException: No live SolrServers available to handle this request
at org.apache.solr.client.solrj.impl.LBHttpSolrClient.request(LBHttpSolrClient.java:460)
at org.apache.solr.client.solrj.impl.CloudSolrClient.sendRequest(CloudSolrClient.java:1121)
at org.apache.solr.client.solrj.impl.CloudSolrClient.requestWithRetryOnStaleState(CloudSolrClient.java:862)
at org.apache.solr.client.solrj.impl.CloudSolrClient.request(CloudSolrClient.java:793)
at org.apache.solr.client.solrj.SolrRequest.process(SolrRequest.java:178)
at org.apache.solr.client.solrj.SolrRequest.process(SolrRequest.java:195)
at org.apache.atlas.repository.graphdb.janus.AtlasJanusGraphIndexClient.performRequestHandlerAction(AtlasJanusGraphIndexClient.java:498)
at org.apache.atlas.repository.graphdb.janus.AtlasJanusGraphIndexClient.createFreeTextRequestHandler(AtlasJanusGraphIndexClient.java:484)
at org.apache.atlas.repository.graphdb.janus.AtlasJanusGraphIndexClient.applySearchWeight(AtlasJanusGraphIndexClient.java:122)


https://community.cloudera.com/t5/Support-Questions/Atlas-Installation-Error/td-p/221554

vim conf/atlas-application.properties
atlas.graph.index.search.solr.zookeeper-url=dm-host118:2181/solr,dm-host214:2181/solr,dm-host211:2181/solr