#!/bin/bash

# Variables
TIMESTAMP=$(date +"%F_%H-%M-%S")
BACKUP_DIR="/home/ubuntu/backups"
MYSQL_USER="cmw_backup"
MYSQL_PASSWORD="Wwewrestler1"
DATABASE_NAME="mysql"
S3_BUCKET="data-backup-automation-project"
BACKUP_FILE="$BACKUP_DIR/$DATABASE_NAME-$TIMESTAMP.sql"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Dump the MySQL database into a SQL file
# Using --single-transaction for large DBs to avoid locking
# Suppressing the password warning for security
mysqldump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" --single-transaction "$DATABASE_NAME" > "$BACKUP_FILE"
if [ $? -eq 0 ]; then
    echo "Database backup successful: $BACKUP_FILE"
else
    echo "Error: Failed to create database backup" >&2
    exit 1
fi

# Upload the backup to S3
aws s3 cp "$BACKUP_FILE" s3://"$S3_BUCKET"/
if [ $? -eq 0 ]; then
    echo "Backup uploaded successfully to S3: s3://$S3_BUCKET/$DATABASE_NAME-$TIMESTAMP.sql"
else
    echo "Error: Failed to upload backup to S3" >&2
    exit 1
fi
