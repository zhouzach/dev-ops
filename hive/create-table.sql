
!-- https://docs.cloudera.com/HDPDocuments/HDP3/HDP-3.1.5/using-hiveql/content/hive_constraints.html

CREATE TABLE stu
(id bigint, name STRING, age int);

insert into stu values
(1,'lily', 18),
(2,'han mei', 28),
(3,'jack', 38),
(4,'tom', 48),
(5,'tailer', 58);

CREATE TABLE class
(id bigint, name STRING);

insert into class values
(1,'class1'),
(2,'class2');



create table db1.t1 stored as parquet as
select * from db1.t2












