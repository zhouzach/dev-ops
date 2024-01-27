The GPG keys listed for the "MySQL 5.7 Community Server" repository are already installed but they are not correct for this package.

rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022

yum localinstall mysql-community-server-5.7.37-1.el7.x86_64.rpm