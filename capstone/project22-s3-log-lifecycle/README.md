# Project 22: S3 Log Archive with Lifecycle

## Goal
Lower cloud storage costs by archiving application and system logs to Amazon S3 and configuring automated lifecycle transitions and expiration rules[cite: 3].

## Steps Performed
1. **Created S3 Archive Bucket & Uploaded Logs:** Provisioned `amrish-capstone-log-archive-<account-id>` in `ap-south-1` and uploaded compressed `.tar.gz` and raw log files under the `archive-logs/` prefix[cite: 3].
2. **Configured S3 Lifecycle Rule (`lifecycle-policy.json`):** Enabled `amrish-p22-log-archive-expiration-rule` to transition archived logs to S3 Glacier after 30 days and automatically expire/delete objects after 90 days[cite: 3].
3. **Verified Lifecycle Configuration:** Confirmed active rule status via `aws s3api get-bucket-lifecycle-configuration` and the AWS S3 Management Console[cite: 3].
