
```
GET _search
{
  "query": {
    "match_all": {}
  }
}
```


```
GET apm-7.13.1-metric-000001/_search
{
  "query": {
    "match_all": {}
  }
}
```


DELETE .kibana*

GET _cat/nodes

GET _cat/indices?v

GET apm*/_search

GET /apm*/_stats/



# only return certain fields
```
POST apm-7.13.1-metric-000001/_search
{
  "_source": {
      "includes": [ "host","jvm", "process" ],
      "excludes": [ "language" ]
  },
  "query" : {
      "match" : { "host.hostname": "arcana-test-prod" }
  }
}
```

```
GET /apm-7.13.1-metric-000001/_doc/_search
{
  "_source": {
    "includes": [
      "host","jvm", "process" 
    ]
  },
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "host.hostname": "arcana-test-prod" 
          }
        }
      ]
    }
  }
}

```


curl -XPOST "HTTP://LOCALHOST:9200/MY-FIRST-INDEX/MESSAGE" -d'
{
"text": "Hello world!"
}'


curl -i -H "Content-Type: application/x-www-form-urlencoded" -XGET "https://127.0.0.1:7089/servicesNS/nobody/search/data/indexes/dawn_aiops" -d'
{
"text": "Hello world!"
}'

curl -ku admin:pscsoft@2019 https://localhost:7089/servicesNS/nobody/search/data/indexes/_internal 

curl -k -u admin:pscsoft@2019 localhost:7089/servicesNS/nobody/search/data/indexes/_internal
curl -k -u admin:pscsoft@2019 https://localhost:7089/servicesNS/nobody/search/data/indexes/_internal?"output_mode=json"
curl -k -u admin:pscsoft@2019 https://localhost:7089/servicesNS/nobody/search/data/indexes-extended?"output_mode=json"


curl -s -k -u admin:pscsoft@2019 https://localhost:7089/services/search/jobs -d search="search index=_internal | head"


curl -s -k -u admin:pscsoft@2019 https://localhost:7089/__raw/servicesNS/nobody/launcher/search/jobs/1628645617.163403/results_preview?output_mode=json
