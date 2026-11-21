# Project 19: S3 Cron Backups

## Project Goal
Shell script (`backup_logs_to_s3.sh`) aur Linux `cron` scheduler ke through application logs aur critical files ko automatically compress (`.tar.gz`) karke Amazon S3 bucket par backup karna.

## Kya & Kaise Kiya
1. **Backup Script (`backup_logs_to_s3.sh`):** Timestamped `.tar.gz` archive banakar `aws s3 cp` se S3 bucket mein upload karne wali executable bash script likhi.
2. **Cron Job & S3 Verification:** `crontab` mein scheduled backup entry add ki aur S3 bucket mein uploaded `.tar.gz` files verify ki.

## Commands Used & Unka Kaam
1. `chmod +x capstone/project19-s3-cron-backup/backup_logs_to_s3.sh`
   - **Kaam:** Backup shell script ko executable permission deta hai.
2. `./capstone/project19-s3-cron-backup/backup_logs_to_s3.sh`
   - **Kaam:** Logs/files ko `.tar.gz` mein compress karke AWS S3 bucket par upload karta hai.
3. `crontab -l`
   - **Kaam:** Scheduled automated cron job entry ko terminal par verify karta hai.
4. `aws s3 ls s3://<BACKUP_BUCKET>/ --recursive --human-readable`
   - **Kaam:** S3 bucket mein uploaded backup archives aur unka size verify karta hai.
