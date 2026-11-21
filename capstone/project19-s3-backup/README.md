# Project 19: Scheduled S3 Backup

## Goal
Automate periodic backup of application and system logs to Amazon S3 using a shell script and Linux `cron` scheduler.

## Steps Performed

1. **S3 Backup Bucket & Script Setup:**
   - Provisioned Amazon S3 bucket (`amrish-capstone-log-backups-<account-id>`) in `ap-south-1`.
   - Created `backup_logs_to_s3.sh` to archive `/var/log/amrish-capstone/app.log` and `/var/log/syslog` into timestamped `.tar.gz` files and upload them to `s3://<bucket>/logs/`.

2. **Cron Job Scheduling & Verification:**
   - Configured a Linux `crontab` entry (`* * * * * /bin/bash .../backup_logs_to_s3.sh`) for automated periodic backups.
   - Verified automated execution logs in `cron_backup.log` and confirmed uploaded backup objects in Amazon S3 via `aws s3 ls`.
