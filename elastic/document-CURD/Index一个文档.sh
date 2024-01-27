#Index和Create不一样的地方：如果文档不存在，就索引新的文档。否则现有文档会被删除，新的文档被索引。版本信息+1

curl -X PUT "192.168.100.211:9200/users/_doc/1?pretty" -H 'Content-Type: application/json' -d'
{
"firstName": "Jack1",
"lastName": "Johnson"
}
'

https://zq99299.github.io/note-book/elasticsearch-core/search-engine/44-mapping-detailed.html#object-field

curl -X PUT "192.168.100.211:9200/company/_doc/1?pretty" -H 'Content-Type: application/json' -d '
{
  "address": {
    "country": "china",
    "province": "guangdong",
    "city": "guangzhou"
  },
  "name": "jack",
  "age": 27,
  "join_date": "2017-01-01"
}'
