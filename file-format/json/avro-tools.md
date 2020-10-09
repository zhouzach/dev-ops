
https://yanbin.blog/avro-tools-jq-view-apache-avro-file/

查看 avro 数据:
avro-tools tojson user.avro

屏蔽 log4j 告警信息
avro-tools tojson user.avro 2>/dev/null

avro-tools getschema user.avro 2>/dev/null

avro-tools getmeta user.avro 2>/dev/null

格式化并高亮显示，命令 avro-tools tojson user.avro | jq
avro-tools tojson user.avro | jq

紧凑高亮显示，命令 avro-tools tojson user.avro | jq -c