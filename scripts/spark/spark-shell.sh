#!/usr/bin/env bash


spark2-shell --master yarn \
  --num-executors 5 \
  --executor-cores 2 \
  --executor-memory 4g \
  --conf spark.dynamicAllocation.enabled=false \
  --conf spark.sql.catalogImplementation=hive \
  --keytab /data/keytab/user.keytab \
  --principal user@mail.cn