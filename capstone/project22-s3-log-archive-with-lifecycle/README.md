# Project 22: Cost-Optimized S3 Log Archiving with Lifecycle Rules

## 1. Project Overview & Goal
The goal of this project is to archive historical logs into an Amazon S3 bucket (`archive-logs/` prefix) and apply automated **S3 Lifecycle Management Rules** (`lifecycle-policy.json`) to transition logs to **Amazon S3 Glacier** after 30 days and automatically expire (delete) them after 90 days to minimize long-term storage costs.

## 2. Files in This Folder
- `lifecycle-policy.json` — Defines the `amrish-p22-log-archive-expiration-rule` transitioning objects under `archive-logs/` to `GLACIER` at 30 days and expiring them at 90 days.

## 3. Step-by-Step Implementation
1. **Archive Bucket & Log Upload:** Created a dedicated S3 archive bucket in `ap-south-1` and uploaded compressed `.tar.gz` and raw log files under `archive-logs/`.
2. **Lifecycle Policy Application:** Applied `lifecycle-policy.json` to the bucket using `aws s3api put-bucket-lifecycle-configuration`.
3. **Rule Verification:** Verified active Glacier transition and expiration intervals via CLI and S3 Management Console.

## 4. Commands Executed & Purpose
1. `aws s3api put-bucket-lifecycle-configuration --bucket $ARCHIVE_BUCKET --lifecycle-configuration file://capstone/project22-s3-log-archive-with-lifecycle/lifecycle-policy.json`
   - **Purpose:** Applies the automated 30-day Glacier transition and 90-day expiration lifecycle rule to the S3 bucket.
2. `aws s3api get-bucket-lifecycle-configuration --bucket $ARCHIVE_BUCKET --output table`
   - **Purpose:** Retrieves and verifies the active lifecycle rule status (`Enabled`), prefix filter, and day thresholds.

## 5. Expected Output & Verification
- S3 Bucket -> Management -> Lifecycle rules displays `amrish-p22-log-archive-expiration-rule` in `Enabled` status.
