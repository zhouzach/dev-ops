


set session transaction isolation level read uncommitted;

set session transaction isolation level read committed;

select @@tx_isolation;

set autocommit = 0;

BEGIN;
commit;
ROLLBACK;

CREATE TABLE runoob_transaction_test( id int(5)) engine=innodb;

select * from runoob_transaction_test;



insert into runoob_transaction_test value(8);