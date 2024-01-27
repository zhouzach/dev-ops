

CREATE TABLE t_test0923  (
  id int ,
  pice decimal(2, 1)
);

insert into t_test0923 values (1,2.2);

CREATE TABLE t_test0923_bak  (
  id int ,
  pice decimal(2, 1)
);

insert overwrite table t_test0923_bak select id,pice from t_test0923;

CREATE VIEW  IF NOT EXISTS t_test0923_bak_view1 AS SELECT id,pice FROM t_test0923_bak;