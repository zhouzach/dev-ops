
INSERT INTO `dashboard`.`user_binlog`(`id`, `uid`, `sex`, `age`, `created_time`) VALUES
(2, 2, 'male', 12, 1596524600482),(3, 3, 'female', 33, 1596524600483);


insert into cash_district(uid,capacity,district)
SELECT uid,capacity,district
from cash_capacity cc
on duplicate key update capacity=cc.capacity,district=cc.district;