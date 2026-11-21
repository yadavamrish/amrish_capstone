# Project 22: S3 Log Archive with Lifecycle

## Project Goal
Application aur system logs ko Amazon S3 par archive karke aur un par automated Storage Class transition (`GLACIER`) aur Expiration (auto-delete) lifecycle rules lagakar long-term cloud storage cost kam karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Archive Bucket Creation & Log Upload:** `ap-south-1` mein `amrish-capstone-log-archive-<account-id>` bucket banaya aur compressed `.tar.gz` aur raw log files ko `archive-logs/` prefix ke andar upload kiya.
2. **S3 Lifecycle Rule Configuration (`lifecycle-policy.json`):** `amrish-p22-log-archive-expiration-rule` enable kiya jo 30 din baad logs ko cheap `GLACIER` storage class mein move karta hai aur 90 din baad permanently expire (delete) kar deta hai.
3. **Lifecycle Policy Verification:** AWS CLI aur S3 Management Console (`Management -> Lifecycle rules`) se active rule status verify kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `aws s3api create-bucket --bucket amrish-capstone-log-archive-$ACCOUNT_ID --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1`
   - **Kaam:** Mumbai (`ap-south-1`) region mein logs archive karne ke liye dedicated S3 bucket create karta hai.
2. `aws s3 cp /tmp/capstone-logs-$TIMESTAMP.tar.gz s3://amrish-capstone-log-archive-$ACCOUNT_ID/archive-logs/`
   - **Kaam:** Compressed log archive ko S3 bucket ke `archive-logs/` prefix mein upload karta hai.
3. `aws s3api put-bucket-lifecycle-configuration --bucket amrish-capstone-log-archive-$ACCOUNT_ID --lifecycle-configuration file://capstone/project22-s3-log-lifecycle/lifecycle-policy.json`
   - **Kaam:** S3 bucket par automated Glacier transition (30 days) aur object expiration (90 days) rule apply karta hai.
4. `aws s3api get-bucket-lifecycle-configuration --bucket amrish-capstone-log-archive-$ACCOUNT_ID --output table`
   - **Kaam:** Bucket par configured active lifecycle rules, prefix filter, aur expiration days ko CLI se verify karta hai.
