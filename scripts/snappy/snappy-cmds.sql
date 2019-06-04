

CREATE EXTERNAL TABLE db1.snappy2hdfs USING parquet OPTIONS(path 'hdfs://localhost:8020/user/snappy/db1/t1/parquent');


CREATE EXTERNAL TABLE ODS.GZB(
FDATE string,
fkmbm string,
fkmmc string,
fhqjg string,
fhqbz string,
fzqsl string,
fzqcb string,
fzqsz string,
fgz_zz string,
fcb_jz_bl string,
fsz_jz_bl string,
ftpxx string,
fqyxx string,
jjdm string

) USING csv OPTIONS(path 'hdfs://localhost:8020/user/sqoop/GZB');


CREATE external TABLE db1.t1 USING jdbc OPTIONS (dbtable 'db1', driver 'oracle.jdbc.driver.OracleDriver',  user 'user1',  password 'user1',  url 'jdbc:oracle:thin:@localhost:1521:orcl');

CREATE external TABLE db2.t2 USING jdbc OPTIONS (dbtable 'db2', driver 'oracle.jdbc.driver.OracleDriver',  user 'user2',  password 'user2',  url 'jdbc:oracle:thin:@localhost:1521:jrdc');


CREATE TABLE db1.users1
(id bigint, name STRING, age STRING, birth date)

insert into db1.users1
(id, name, age, birth)
VALUES
(1, 'lily', '12', '1985‑09‑25'),
(2, 'tom', '12', '1985‑09‑25'),
(3, 'jack', null, '1985‑09‑25')
