#!/bin/bash

# USERNAME
# PASSWORD
# HOSTNAME
# DIRECTORY

# Dont forget: chmod +x mysqlbackup_list_from-db.sh

for database in `echo "show databases;" | mysql -u<USERNAME> -p<PASSWOERD> -h <HOSTNAME or IP> | grep -v Database |grep -v information_schema | grep -v performance_schema`; do

echo "START $database"
mysqldump --events --opt --extended-insert --complete-insert --create-options --add-drop-database --add-drop-table -R -u<USERNAME> -p<PASSWORD> -h <HOSTNAME> $database > /<DIRECTORY>/`date +%Y-%m-%d`/$database.sql
echo "STOP $database"

done
