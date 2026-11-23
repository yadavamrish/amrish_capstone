# Project 22: S3 Log Archive with Lifecycle

## Goal
Automate log storage cost optimization and retention by configuring an Amazon S3 Lifecycle expiration rule.

## Steps Performed
1. Uploaded application/server log files into an S3 bucket (`logs/` prefix).
2. Created an S3 Lifecycle Configuration rule scoped to the `logs/` prefix.
3. Configured automatic transition to Infrequent Access / Glacier and permanent **Expiration** after 30 days.
4. Verified the active Lifecycle rule status in the S3 Management tab.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `aws s3 cp app.log s3://<BUCKET-NAME>/logs/app.log` | Uploads log files into the `logs/` prefix of the S3 bucket. |
| `aws s3api get-bucket-lifecycle-configuration --bucket <BUCKET-NAME>` | Displays the active S3 lifecycle transition and expiration rules in JSON format. |

## Deliverables
- Screenshot of the S3 Lifecycle Expiration rule configuration (`screenshots/`)
