#!/bin/bash
 
################ Simple Script for Backup DB Only ################
 
## Author German Sandoval
## Data 4/29/2023
 
## create dir for Testdb DB
mkdir -p /var/backups/Testdb_$(date "+%m_%d_%Y")
 
## Dump Export Backup
mydumper --threads 4 \
--host localhost \
--user backupuser \
--password mypassword \
--database Testdb \
--compress \
--events \
--triggers \
--routines \
--rows="10000000" \
--verbose 3 \
--long-query-guard 999999 \
--compress-protocol \
--outputdir /var/backups/Testdb_$(date "+%m_%d_%Y")/Testdb \
--logfile /var/backups/Testdb_$(date "+%m_%d_%Y")/backup-Testdb.log
 
## create dir for DB_Backup
mkdir -p /var/backups/database_backups_$(date "+%m_%d_%Y")
 
## Dump Export Backup
mydumper --threads 4 \
--host localhost \
--user backupuser \
--password mypassword \
--database Testdb \
--compress \
--events \
--triggers \
--routines \
--rows="10000000" \
--verbose 3 \
--long-query-guard 999999 \
--compress-protocol \
--outputdir /var/backups/Testdb_$(date "+%m_%d_%Y")/Testdb \
--logfile /var/backups/Testdb_$(date "+%m_%d_%Y")/backup-Testdb.log