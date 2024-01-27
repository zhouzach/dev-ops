
CREATE TABLE `orders` (
   `srcuid` bigint(20) DEFAULT NULL,
   `price` bigint(20) DEFAULT NULL,
   UNIQUE KEY `idx_srcuid_price` (`srcuid`,`price`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `user_info` (
   `uid` bigint(20) NOT NULL,
   `sex` VARCHAR(10) DEFAULT NULL,
   `age` int DEFAULT NULL,
   `created_time` bigint(20) DEFAULT NULL,
   PRIMARY KEY ( `uid` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;