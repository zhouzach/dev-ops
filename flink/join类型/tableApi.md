
https://nightlies.apache.org/flink/flink-docs-release-1.14/docs/dev/table/sql/queries/joins/
Flink SQL supports complex and flexible join operations over dynamic tables.

By default, the order of joins is not optimized. Tables are joined in the order in which they are specified in the FROM clause. 
You can tweak the performance of your join queries, by listing the tables with the lowest update frequency first 
and the tables with the highest update frequency last. 
Make sure to specify tables in an order that does not yield a cross join (Cartesian product), 
which are not supported and would cause a query to fail.



Configuration configuration = tEnv.getConfig().getConfiguration();

https://nightlies.apache.org/flink/flink-docs-release-1.14/docs/dev/table/config/#table-exec-state-ttl
## Specifies a minimum time interval for how long idle state (i.e. state which was not updated), will be retained. 
## State will never be cleared until it was idle for less than the minimum time, and will be cleared at some time after it was idle. 
## Default is never clean-up the state. NOTE: Cleaning up state requires additional overhead for bookkeeping. 
## Default value is 0, which means that it will never clean up state.

https://nightlies.apache.org/flink/flink-docs-release-1.14/docs/dev/table/concepts/overview/#idle-state-retention-time
## The Idle State Retention Time parameter table.exec.state.ttl defines for how long the state of a key is retained without being updated 
## before it is removed. For the previous example query, the count of asessionId would be removed as soon as it has not been updated 
# for the configured period of time.

## By removing the state of a key, the continuous query completely forgets that it has seen this key before. 
## If a record with a key, whose state has been removed before, is processed, 
## the record will be treated as if it was the first record with the respective key. 
## For the example above this means that the count of a sessionId would start again at 0.

configuration.setString("table.exec.state.ttl", "5000 ms");

configuration.setString("table.exec.mini-batch.enabled", "true");
configuration.setString("table.exec.mini-batch.allow-latency", "5 s");
configuration.setString("table.exec.mini-batch.size", "5000");







Interval Joins:
# 间隔联接仅支持具有时间属性的仅追加表。 由于时间属性是准单调递增的，因此 Flink 可以从其状态中移除旧值而不影响结果的正确性。
interval join only supports append-only tables with time attributes. Since time attributes are quasi-monotonic increasing, 
Flink can remove old values from its state without affecting the correctness of the result.

SELECT *
FROM Orders o, Shipments s
WHERE o.id = s.order_id
AND o.order_time BETWEEN s.ship_time - INTERVAL '4' HOUR AND s.ship_time