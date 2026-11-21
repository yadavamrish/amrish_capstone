# Project 19: Automated Log & File Backups to S3 via Linux Cron

## 1. Project Overview & Goal
Disaster recovery aur data durability ke liye executable bash script (`backup_logs_to_s3.sh`) aur Linux **cron** scheduler ke zariye application logs ko automatically timestamped `.tar.gz` archive mein compress karke **Amazon S3** par backup karna.

## 2. Files in This Folder
- `backup_logs_to_s3.sh` — Logs ko `.tar.gz` format mein compress karke `aws s3 cp` se S3 bucket par upload karne wali automation script.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Backup Script Creation (`backup_logs_to_s3.sh`):** Timestamped archive creation, S3 upload, aur local temp file cleanup logic likha.
2. **Cron Job Scheduling:** `crontab` mein scheduled entry add ki taaki backup script bina manual intervention ke automatically run ho.
3. **S3 Bucket Verification:** Script execute karke S3 bucket ke andar uploaded `.tar.gz` archive verify kiya.

## 4. Commands Executed & Unka Kaam
1. `chmod +x capstone/project19-s3-cron-backup/backup_logs_to_s3.sh`
   - **Kaam:** Backup bash script ko executable permission deta hai.
2. `./capstone/project19-s3-cron-backup/backup_logs_to_s3.sh`
   - **Kaam:** Target logs ko compress karke S3 bucket mein upload karta hai.
3. `crontab -l`
   - **Kaam:** Active scheduled cron job entry terminal par verify karta hai.
4. `aws s3 ls s3://<BACKUP_BUCKET>/ --recursive --human-readable`
   - **Kaam:** S3 bucket mein uploaded `.tar.gz` backup archives aur unka size check karta hai.

## 5. Expected Output / Verification
- S3 bucket mein timestamped `.tar.gz` backup files upload hoti hain aur `crontab -l` mein scheduled job active dikhti hai.
