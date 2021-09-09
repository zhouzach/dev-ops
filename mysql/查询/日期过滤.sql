
SELECT count(DISTINCT uid )
FROM   live_mic_time
WHERE  starttime between unix_timestamp('2020-11-16 00:00:00')
       and unix_timestamp('2020-11-16 23:59:59');



 select   FROM_UNIXTIME(loginTime, '%Y-%m-%d %H:%i:%S' ) AS '最后登录时间';