CREATE TABLE `druid_dataSource`
(
    `dataSource`           varchar(255) NOT NULL,
    `created_date`         varchar(255) NOT NULL,
    `commit_metadata_payload` BLOB NOT NULL,
    `commit_metadata_sha1` varchar(255) NOT NULL,
    PRIMARY KEY (`dataSource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;