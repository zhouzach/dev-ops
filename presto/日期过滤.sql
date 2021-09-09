
SELECT srcuid,amount
FROM dwd.pay_order
WHERE paytime BETWEEN To_unixtime(Date_parse('2020-11-30 00:00:00', '%Y-%m-%d %H:%i:%s'))
    AND To_unixtime(Date_parse('2020-11-30 23:59:59', '%Y-%m-%d %H:%i:%s'))
  AND status = 2;






select date_format(from_unixtime(1602494403), '%Y-%m-%d %H:%i:%s')