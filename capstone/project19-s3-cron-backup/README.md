# Project 19: Automated S3 Cron Backups

## Project Goal
Disaster recovery aur data durability ke liye critical application files aur configurations ko Linux `cron` scheduler ke through automatically compress karke Amazon S3 bucket par backup karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Backup Automation Script (`backup-to-s3.sh`):** Shell script likhi jo target project files ko timestamped `.tar.gz` archive mein compress karke `aws s3 cp` se S3 bucket mein upload karti hai aur execution status log karti hai.
2. **Cron Job Scheduling:** `crontab` mein scheduled entry add ki taaki backup script bina manual intervention ke automatically run ho.
3. **S3 Backup Verification:** Script run karke S3 bucket ke `backups/` prefix mein uploaded `.tar.gz` archive aur local cron log verify kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `tar -czf "/tmp/capstone-backup-$(date +%Y%m%d-%H%M%S).tar.gz" -C ~/Desktop/Capston capstone/`
   - **Kaam:** Capstone directory ko compress karke ek timestamped `.tar.gz` archive file banata hai.
2. `aws s3 cp /tmp/capstone-backup-*.tar.gz s3://$BACKUP_BUCKET/backups/`
   - **Kaam:** Compressed local backup archive ko AWS S3 bucket ke `backups/` folder mein upload karta hai.
3. `(crontab -l 2>/dev/null; echo "0 2 * * * $HOME/Desktop/Capston/capstone/project19-s3-cron-backup/backup-to-s3.sh >> /var/log/s3-backup.log 2>&1") | crontab -`
   - **Kaam:** Linux `crontab` mein roz raat 2:00 AM par automated backup script chalane aur logs save karne ka cron job schedule karta hai.
4. `crontab -l`
   - **Kaam:** Current user ke sabhi active scheduled cron jobs ki list print karta hai.
5. `aws s3 ls s3://$BACKUP_BUCKET/backups/ --human-readable`
   - **Kaam:** S3 bucket mein uploaded backup archives, unke timestamps, aur file size verify karta hai.
