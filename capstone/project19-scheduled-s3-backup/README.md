# Project 19: Automated Log & File Backups to S3 via Linux Cron

## 1. Project Overview & Goal
The goal of this project is to automate disaster recovery backups by compressing application logs and critical files into timestamped `.tar.gz` archives via a bash script (`backup_logs_to_s3.sh`) and uploading them to **Amazon S3** on a recurring schedule using Linux **cron**.

## 2. Files in This Folder
- `backup_logs_to_s3.sh` — Executable shell script that creates a timestamped `.tar.gz` archive, uploads it to S3 via `aws s3 cp`, and cleans up temporary local files.

## 3. Step-by-Step Implementation
1. **Backup Script Authoring (`backup_logs_to_s3.sh`):** Built a shell script with timestamp formatting, `tar -czf` compression, S3 upload, and status logging.
2. **Cron Scheduling:** Registered a scheduled cron entry in `crontab` to execute the backup script automatically without manual intervention.
3. **S3 Bucket Verification:** Executed the script and verified uploaded `.tar.gz` archives inside the target S3 bucket.

## 4. Commands Executed & Purpose
1. `chmod +x capstone/project19-s3-cron-backup/backup_logs_to_s3.sh`
   - **Purpose:** Grants execution permissions to the backup shell script.
2. `./capstone/project19-s3-cron-backup/backup_logs_to_s3.sh`
   - **Purpose:** Compresses logs into a `.tar.gz` archive and uploads it to Amazon S3.
3. `crontab -l`
   - **Purpose:** Lists active user cron jobs to verify the scheduled backup entry.
4. `aws s3 ls s3://<BACKUP_BUCKET>/ --recursive --human-readable`
   - **Purpose:** Confirms that compressed `.tar.gz` backup objects exist in the S3 bucket with expected file sizes.

## 5. Expected Output & Verification
- Timestamped `.tar.gz` archives appear in S3 and `crontab -l` displays the scheduled backup job.
