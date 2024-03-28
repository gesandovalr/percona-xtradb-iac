#!/bin/bash

################ Script for DB restoration ################

## Author German Sandoval
## Data 4/29/2023

## Read Database entered variable
echo "Please enter Database name to restore"
read -p 'Database_Name: ' db_name
echo "Please insert restore file dump database_name_month_day_year prefix"
read -p 'restore_file: ' db_dump

myloader --threads 4 \
--host=localhost \
--user=backupuser \
--password=mypassword \
--database=$db_name \
--directory=/var/backups/$db_dump/$db_name \
--queries-per-transaction=50000 \
--verbose=3 \
--compress-protocol \