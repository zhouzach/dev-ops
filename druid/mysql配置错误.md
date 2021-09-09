


-- create a druid database, make sure to use utf8mb4 as encoding
CREATE DATABASE druid DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;

-- grant the user all the permissions on the database we just created
GRANT ALL ON druid.* TO 'druid'@'qile-test-cdh002' IDENTIFIED BY 'druid';

flush privileges;

