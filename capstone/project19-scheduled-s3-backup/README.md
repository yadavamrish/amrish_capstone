# Project 19: Scheduled S3 Backup

## Goal
Automate scheduled daily backups of server logs to an Amazon S3 bucket using a Linux `cron` job.

## Steps Performed
1. Created a backup Bash script (`backup_logs.sh`) that compresses `/var/log` files with a timestamp and uploads them to S3.
2. Made the script executable (`chmod +x`) and tested it manually.
3. Added a `crontab` schedule entry to run the backup automatically every day.
4. Verified the uploaded `.tar.gz` backup archives inside the S3 bucket.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `tar -czf /tmp/logs-$(date +%F).tar.gz /var/log/nginx` | Compresses server log files into a dated `.tar.gz` archive. |
| `aws s3 cp /tmp/logs-*.tar.gz s3://<BACKUP-BUCKET>/logs/` | Uploads the compressed log archive to the target Amazon S3 bucket. |
| `crontab -e` | Opens the user cron table to schedule `0 2 * * * /home/ubuntu/backup_logs.sh`. |
| `aws s3 ls s3://<BACKUP-BUCKET>/logs/` | Lists backed-up archive files stored in S3 as verification. |

## Deliverables
- Backup script (`backup_logs.sh`) and crontab entry
- Screenshot of S3 bucket showing uploaded backup files (`screenshots/`)
