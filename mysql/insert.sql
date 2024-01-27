
INSERT INTO `dashboard`.`user_binlog`(`id`, `uid`, `sex`, `age`, `created_time`) VALUES
(2, 2, 'male', 12, 1596524600482),(3, 3, 'female', 33, 1596524600483);


insert into cash_district(uid,capacity,district)
SELECT uid,capacity,district
from cash_capacity cc
on duplicate key update capacity=cc.capacity,district=cc.district;



CREATE TABLE `user_info` (
                        `uid` bigint(20) NOT NULL,
                        `sex` VARCHAR(10) DEFAULT NULL,
                        `age` int DEFAULT NULL,
                        `created_time` bigint(20) DEFAULT NULL,
                        PRIMARY KEY ( `uid` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


insert into `user_info`
values (1, 'female', 23, 1596524600483),
       (2, 'male', 33, 1596524600583),
       (3, 'female', 36, 1596524610483),
       (4, 'male', 23, 1596524610483),
       (5, 'female', 25, 1596524602483);
