
# TTL 为 18000 秒
create 't1', {NAME => 'cf', VERSIONS => 1, TTL => '18000', COMPRESSION => 'SNAPPY', BLOOMFILTER => 'ROW'}