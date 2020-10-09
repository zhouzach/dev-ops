-- https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-CreateTableCreate/Drop/TruncateTable


-- Version information

-- As of Hive 2.1.0 (HIVE-13290).

create table pk(id1 integer, id2 integer,
  primary key(id1, id2) disable novalidate);

create table fk(id1 integer, id2 integer,
                constraint c1 foreign key(id1, id2) references pk(id2, id1) disable novalidate);




-- Version information

-- As of Hive 3.0.0 (HIVE-16575, HIVE-18726, HIVE-18953).

create table constraints1(id1 integer UNIQUE disable novalidate, id2 integer NOT NULL,
                          usr string DEFAULT current_user(), price double CHECK (price > 0 AND price <= 1000));

create table constraints2(id1 integer, id2 integer,
                          constraint c1_unique UNIQUE(id1) disable novalidate);

create table constraints3(id1 integer, id2 integer,
                          constraint c1_check CHECK(id1 + id2 > 0));