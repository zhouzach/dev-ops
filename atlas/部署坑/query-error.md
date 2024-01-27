
ERROR - [main:] ~ Request to collection [vertex_index] failed due to (0) java.net.ConnectException: 拒绝连接 (Connection refused), retry=2 commError=true errorCode=0  (BaseCloudSolrClient:960)

org.apache.solr.client.solrj.impl.CloudSolrClient$RouteException: No live SolrServers available to handle this request:[http://192.168.100.118:9838/solr/vertex_index_shard1_replica_n1]


https://www.mail-archive.com/search?l=solr-user@lucene.apache.org&q=subject:%22No+live+SolrServers+available+to+handle+this+request%22&o=newest&f=1





Re: No live SolrServers available to handle this request
2015-11-09 Thread wilanjar .
Hi Erick,

Thanks for your response.
You right my node running properly and the graph is green.
we solve with remove the data index in collection and reindex again.

Thanks

On Fri, Nov 6, 2015 at 11:02 PM, Erick Erickson <erickerick...@gmail.com>
wrote:

> The host may be running well, but my bet is that
> you have an error in the schema.xml file so it's
> no longer valid XML and the core did not load.
>
> So while the solr instance is up and running, no
> core using that schema is running, thus no
> live servers.
>
> Look at the admin UI, cloud>>graph view and
> if the collection you're trying to operate on is
> not green, then that's probably the issue.
>
> Otherwise look through the Solr log file and
> you should see some exceptions that may
> point the way.
>
> Best,
> Erick
>
> On Thu, Nov 5, 2015 at 11:58 PM, wilanjar . <wilan...@gmail.com> wrote:
> > Hi All,
> >
> > I'm very new handle the solrcloud.
> > I've changed the scema.xml with adding field to index but after reload
> the
> > collection we got error from logging " No live SolrServers available to
> > handle this request".
> >
> > i have check solrcloud from localhost each node and running  well.
> > i'm using solr version 4.10.4 lucene version 4.10.4
> > tomcat 8.0.27
> > zookeeper 3.4.6.
> >
> > I already googling but not get solution yet.
> >
> > Thank you.
>

Re: No live SolrServers available to handle this request
2015-11-09 Thread wilanjar .
Hi Erick,

Thanks for your response.
You right my node running properly and the graph is green.
we solve with remove the data index in collection and reindex again.

Thanks

On Fri, Nov 6, 2015 at 11:02 PM, Erick Erickson <erickerick...@gmail.com>
wrote:

> The host may be running well, but my bet is that
> you have an error in the schema.xml file so it's
> no longer valid XML and the core did not load.
>
> So while the solr instance is up and running, no
> core using that schema is running, thus no
> live servers.
>
> Look at the admin UI, cloud>>graph view and
> if the collection you're trying to operate on is
> not green, then that's probably the issue.
>
> Otherwise look through the Solr log file and
> you should see some exceptions that may
> point the way.
>
> Best,
> Erick
>
> On Thu, Nov 5, 2015 at 11:58 PM, wilanjar . <wilan...@gmail.com> wrote:
> > Hi All,
> >
> > I'm very new handle the solrcloud.
> > I've changed the scema.xml with adding field to index but after reload
> the
> > collection we got error from logging " No live SolrServers available to
> > handle this request".
> >
> > i have check solrcloud from localhost each node and running  well.
> > i'm using solr version 4.10.4 lucene version 4.10.4
> > tomcat 8.0.27
> > zookeeper 3.4.6.
> >
> > I already googling but not get solution yet.
> >
> > Thank you.
>
