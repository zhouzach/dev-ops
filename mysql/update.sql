
UPDATE `dashboard`.`user_binlog` SET sex='male' WHERE id=3;


--https://dev.mysql.com/doc/refman/8.0/en/update.html
--update Multiple-table syntax:
UPDATE items,
       (SELECT id, retail / wholesale AS markup, quantity FROM items)
       AS discounted
SET items.retail = items.retail * 0.9
    WHERE discounted.markup >= 1.3
    AND discounted.quantity < 100
    AND items.id = discounted.id;



--https://stackoverflow.com/questions/1262786/mysql-update-query-based-on-select-query
--update inner join
UPDATE tableA a
INNER JOIN tableB b ON a.name_a = b.name_b
SET validation_check = if(start_dts > end_dts, 'VALID', '')
-- where clause can go here


--update left join
UPDATE dbname1.content targetTable
LEFT JOIN dbname2.someothertable sourceTable ON
    targetTable.compare_field= sourceTable.compare_field
SET
    targetTable.col1  = sourceTable.cola,
    targetTable.col2 = sourceTable.colb,
    targetTable.col3 = sourceTable.colc,
    targetTable.col4 = sourceTable.cold