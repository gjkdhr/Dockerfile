#!/bin/bash

function config_mysql(){
	echo "Running the mysqld config"
	/usr/bin/mysql_install_db
	chown -R mysql:mysql /var/lib/mysql
	/usr/bin/mysqld_safe &
	sleep 5
}

function config_passwd(){
	#config the root password for mysqld
	/usr/bin/mysqladmin -u root password "redhat"
	#create the database testdb,the work enviorment .
	mysql -uroot -predhat -e "CREATE DATABASE testdb;"
	mysql -uroot -predhat -e "GRANT ALL PRIVILEGES ON *.* TO 'testdb'@'localhost' IDENTIFIED BY 'testdb';FLUSH PRIVILEGES;" 
	mysql -uroot -predhat -e "GRANT ALL PRIVILEGES ON testdb.* TO 'testdb'@'%' IDENTIFIED BY 'testdbadmin'; FLUSH PRIVILEGES;"
	mysql -uroot -predhat -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'dbadmin';FLUSH PRIVILEGES;"
	mysql -uroot -predhat -e "select user, host FROM mysql.user;"
	killall mysqld

}
config_mysql
config_passwd
