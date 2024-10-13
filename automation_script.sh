#!/bin/bash

# Variables
SCRIPT_PATH="/home/ubuntu/backup-scripts/mysql_backup.sh"
LOG_PATH="/home/ubuntu/backup-scripts/backup.log" 

# Cron job schedule: Run every day at 2 AM
CRON_JOB="0 2 * * * $SCRIPT_PATH >> $LOG_PATH 2>&1"

# Check if the cron job already exists
crontab -l | grep -q "$SCRIPT_PATH"

if [ $? -eq 0 ]; then
    echo "Cron job already exists. Exiting."
else
    # Add the cron job to the crontab
    (crontab -l; echo "$CRON_JOB") | crontab -
    echo "Cron job added: $CRON_JOB"
fi
