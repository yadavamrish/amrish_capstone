#!/bin/bash
set -e

TIMESTAMP=$(date -u +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="/tmp/log-backup-${TIMESTAMP}"
ARCHIVE_FILE="/tmp/logs-backup-${TIMESTAMP}.tar.gz"
S3_BUCKET="s3://amrish-capstone-log-backups-590507089733"

mkdir -p "${BACKUP_DIR}"
cp /var/log/amrish-capstone/app.log "${BACKUP_DIR}/" 2>/dev/null || true
cp /var/log/syslog "${BACKUP_DIR}/" 2>/dev/null || true

tar -czf "${ARCHIVE_FILE}" -C "${BACKUP_DIR}" .
/usr/local/bin/aws s3 cp "${ARCHIVE_FILE}" "${S3_BUCKET}/logs/logs-backup-${TIMESTAMP}.tar.gz" --region ap-south-1

rm -rf "${BACKUP_DIR}" "${ARCHIVE_FILE}"
echo "$(date -u) [SUCCESS] Uploaded logs-backup-${TIMESTAMP}.tar.gz to ${S3_BUCKET}/logs/" >> ~/Desktop/Capston/capstone/project19-s3-backup/cron_backup.log
