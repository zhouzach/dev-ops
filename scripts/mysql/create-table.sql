
CREATE TABLE `orders` (
   `srcuid` bigint(20) DEFAULT NULL,
   `price` bigint(20) DEFAULT NULL,
   UNIQUE KEY `idx_srcuid_price` (`srcuid`,`price`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;