#!/usr/bin/env bash


mysql -uroot -p123456



ALTER TABLE t_customer_participation MODIFY isAudiences varCHAR(100);

ALTER TABLE t_customer_participation MODIFY activeCustomerCount bigint(20);


