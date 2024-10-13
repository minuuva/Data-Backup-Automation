# Data-Backup-Automation

🛠️ **Data Backup Automation Project** 

🚀This project automates the backup of MySQL databases and important files, storing them securely in AWS S3. The automation uses Bash scripts and is scheduled with cron jobs, ensuring that backups are created at regular intervals and uploaded to the cloud for safekeeping.

📋 **Table of Contents**
Overview
Features
Tools Used
How It Works
Setup Instructions
Automation with Cron Jobs
Usage
Contributing

📝 **Overview**
In this project, we automate the process of backing up MySQL databases and files to AWS S3. This ensures that critical data is securely stored in the cloud, safe from local system failures. The automation is handled through Bash scripts and cron jobs, providing an efficient way to handle data backups on a regular schedule.

⭐ **Features**
Automated Backup: Automatically create backups of your MySQL database and important files.
S3 Integration: Automatically upload backups to AWS S3 for secure cloud storage.
Easy Scheduling: Use cron jobs to schedule backups at regular intervals.
Logging: Keep track of backup and upload activities using log files.
🛠️ Tools Used
Ubuntu: For running the scripts and managing cron jobs.
Bash: Bash scripting to automate the backup process.
MySQL: MySQL client for creating database backups.
AWS S3: For secure cloud storage of backup data.
AWS CLI: Command-line interface to interact with AWS S3 for uploading backups.
Cron: For automating the scheduling of the backups.

🛡️ **How It Works**
The project consists of two key scripts:

Backup Script (mysql_backup.sh):

Backs up a MySQL database to a local directory.
Compresses important files and directories.
Uploads the backup files to a specified AWS S3 bucket.
Automation Script (automation_script.sh):

Adds a cron job to automatically execute the backup script at specified intervals.
The cron job runs the backup script every day at 2 AM, uploading the backup data to S3.
⚙️ Setup Instructions
Follow these steps to set up the project on your Ubuntu EC2 instance (or any Linux environment):

**Step 1**: Clone the Repository | bash
```
git clone https://github.com/minuuva/Data-Backup-Automation.git
cd Data-Backup-Automation
```

**Step 2**: Configure AWS CLI | bash
Ensure that AWS CLI is installed and configured with proper permissions for S3 access:

aws configure
Provide the necessary AWS Access Key, Secret Key, and Region during the configuration.

**Step 3**: Edit the Backup Script | bash
Before running the script, open the mysql_backup.sh file and replace the following placeholders with real values:

MYSQL_USER="your_mysql_user"
MYSQL_PASSWORD="your_mysql_password"
DATABASE_NAME="your_database_name"
S3_BUCKET="your-s3-bucket-name"

**Step 4**: Make the Scripts Executable | bash
Make sure the scripts are executable:

chmod +x mysql_backup.sh
chmod +x automation_script.sh

⏰ **Automation with Cron Jobs**
You can automate the backup process by running the automation script to set up the cron job. This will schedule the backup script to run daily at 2 AM and store the backups in S3.

**Step 1**: Run the Automation Script | bash
./automation_script.sh

**Step 2**: Verify Cron Jobs | bash
Check if the cron job was successfully added:

crontab -l

You should see the cron job listed, which looks like this:
0 2 * * * /home/ubuntu/backup-scripts/mysql_backup.sh >> /home/ubuntu/backup-scripts/backup.log 2>&1
This will run the backup script at 2 AM every day.

🚀 **Usage** | bash
You can run the backup script manually at any time:

./mysql_backup.sh
This will:

Create a backup of your MySQL database.
Upload the backup to your AWS S3 bucket.
Log the results to a log file.

🤝 Contributing
Feel free to contribute to this project by creating issues or submitting pull requests. Let's make data backup automation even better together!
