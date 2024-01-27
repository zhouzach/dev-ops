


支持自动生成文档ID和指定文档ID两种方式
通过调用"post /users/_doc",系统会自动生成document ID

curl -X POST "192.168.100.211:9200/users/_doc?pretty" -H 'Content-Type: application/json' -d'
{
  "firstName": "Han",
  "lastName": "Mei"
}
'

使用 PUT users/_create/1创建时,URI中显示指定_create,此时如果该ID的文档已经存在,操作失败

curl -X PUT "192.168.100.211:9200/users/_create/1?pretty" -H 'Content-Type: application/json' -d'
{
  "firstName": "Jack",
  "lastName": "Johnson"
}
'