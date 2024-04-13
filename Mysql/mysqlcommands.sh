#!/bin/bash
'''
Assume that we have mysql installed on local system if not please follow the Link "https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/" or 
run command "sudo apt-get install mysql-server"
'''

DB_USER="root"
DB_PASS="BI9l@spH6"
DB_NAME="customer"

# SQL commands to create database and tables
SQL_CREATE_DB="CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
SQL_USE_DB="USE ${DB_NAME};"
SQL_CREATE_TABLE1="CREATE TABLE IF NOT EXISTS ${DB_NAME}.users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255)
);"
SQL_INSERT_DATA1="INSERT INTO ${DB_NAME}.users (first_name, last_name, email) VALUES ('Himanshu', 'Pandit', 'himanshu@gmail.com'), ('test', 'user', 'test@gmail.com');"
SQL_INSERT_DATA2="INSERT INTO ${DB_NAME}.users (first_name, last_name, email) VALUES ('John', 'wick', '31john@gmail.com');"
SQL_UPDATE_DATA1="UPDATE ${DB_NAME}.users SET first_name='Tolstoy' WHERE Id=2;"
SQL_DELETE_DATA1="DELETE FROM ${DB_NAME}.users WHERE first_name = 'Tolstoy';"


# Execute SQL commands
mysql -u"$DB_USER" -p"$DB_PASS" -e "$SQL_CREATE_DB"
mysql -u"$DB_USER" -p"$DB_PASS" -e "$SQL_USE_DB"
mysql -u"$DB_USER" -p"$DB_PASS" -e "$SQL_CREATE_TABLE1"
mysql -u"$DB_USER" -p"$DB_PASS" -e "$SQL_INSERT_DATA1"
mysql -u"$DB_USER" -p"$DB_PASS" -e "$SQL_INSERT_DATA2"
mysql -u"$DB_USER" -p"$DB_PASS" -e "$SQL_UPDATE_DATA1"
mysql -u"$DB_USER" -p"$DB_PASS" -e "$SQL_DELETE_DATA1"

echo "Database and tables created successfully."


