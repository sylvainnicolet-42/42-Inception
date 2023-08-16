#!/bin/sh

# Start SQL service
service mysql start;

# Create a database (if the database does not exist)
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create an user with a password (if the user does not exist)
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Give all privileges to the user
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Modify SQL database
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Reload the database
mysql -e "FLUSH PRIVILEGES;"

# Shutdown
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

# Start SQL service
exec mysqld_safe