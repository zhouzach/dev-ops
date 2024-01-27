
更新不会删除原来的文档,而是实现真正的数据更新

POST方法 URI中显示指定 _update
Payload需要包含在"doc"中

curl -X POST "192.168.100.211:9200/users/_update/1?pretty" -H 'Content-Type: application/json' -d'
{
  "doc": {
    "firstName": "Han",
    "lastName": "Mei"
  }
}
'