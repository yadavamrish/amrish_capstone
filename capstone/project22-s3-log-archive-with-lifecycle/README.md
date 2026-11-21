# Project 22: S3 Log Archive with Lifecycle

## Project Goal
Logs ko Amazon S3 archive bucket (`archive-logs/` prefix) mein store karke `lifecycle-policy.json` ke zariye 30 din baad `GLACIER` storage class transition aur 90 din baad automatic object expiration enforce karna.

## Kya & Kaise Kiya
1. **Archive Bucket & Log Upload:** `amrish-capstone-log-archive-<account-id>` bucket banakar compressed `.tar.gz` aur raw log files upload ki.
2. **Lifecycle Rule Enforcement (`lifecycle-policy.json`):** `amrish-p22-log-archive-expiration-rule` apply karke `GLACIER` transition aur expiration verify kiya.

## Commands Used & Unka Kaam
1. `aws s3api put-bucket-lifecycle-configuration --bucket $ARCHIVE_BUCKET --lifecycle-configuration file://capstone/project22-s3-log-archive-with-lifecycle/lifecycle-policy.json`
   - **Kaam:** S3 bucket par automated Glacier transition (30 days) aur Expiration (90 days) lifecycle rule apply karta hai.
2. `aws s3api get-bucket-lifecycle-configuration --bucket $ARCHIVE_BUCKET --output table`
   - **Kaam:** Bucket par active lifecycle policy rules aur expiration days verify karta hai.
