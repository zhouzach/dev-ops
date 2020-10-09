#!/usr/bin/env bash

hbase shell

RMB10offer audiences
put 'root:customer', '437524iks', 'cf_:tag_1', '1'



get 'root:customer', '437524iks', 'cf_:tag_2'

scan 'root:customer', {COLUMNS => 'cf_:tag_1', LIMIT =>400}

scan 'root:customer', {COLUMNS => 'cf_:tag_2'}

