# Project 22: Cost-Optimized S3 Log Archiving with Lifecycle Rules

## 1. Project Overview & Goal
Historical logs ko Amazon S3 archive bucket (`archive-logs/` prefix) mein store karke `lifecycle-policy.json` ke zariye automated **S3 Glacier** storage class transition (30 days) aur **Expiration** auto-deletion (90 days) enforce karna taaki long-term storage cost kam ho.

## 2. Files in This Folder
- `lifecycle-policy.json` — S3 Lifecycle rule (`amrish-p22-log-archive-expiration-rule`) jo `archive-logs/` objects ko 30 din baad `GLACIER` mein move karta hai aur 90 din baad expire karta hai.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Archive Bucket & Upload:** Dedicated S3 bucket banakar compressed `.tar.gz` aur raw log files ko `archive-logs/` prefix mein upload kiya.
2. **Lifecycle Rule Enforcement:** `put-bucket-lifecycle-configuration` se `lifecycle-policy.json` apply kiya.
3. **Policy Verification:** `get-bucket-lifecycle-configuration` aur S3 Management Console se active transition/expiration rules verify kiye.

## 4. Commands Executed & Unka Kaam
1. `aws s3api put-bucket-lifecycle-configuration --bucket $ARCHIVE_BUCKET --lifecycle-configuration file://capstone/project22-s3-log-archive-with-lifecycle/lifecycle-policy.json`
   - **Kaam:** S3 bucket par automated Glacier transition (30 days) aur object expiration (90 days) rule apply karta hai.
2. `aws s3api get-bucket-lifecycle-configuration --bucket $ARCHIVE_BUCKET --output table`
   - **Kaam:** Bucket par active lifecycle rule status (`Enabled`), prefix, aur transition/expiration days verify karta hai.

## 5. Expected Output / Verification
- S3 Bucket -> Management -> Lifecycle rules mein `amrish-p22-log-archive-expiration-rule` `Enabled` state mein dikhta hai.
