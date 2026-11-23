# Project 23: IAM Role Based Access

## Goal
Enable secure, credential-free access to Amazon S3 from an EC2 instance by attaching an IAM Instance Profile Role.

## Steps Performed
1. Created an IAM Role for EC2 (`EC2-S3-Access-Role`) with `AmazonS3ReadOnlyAccess` (or scoped S3 bucket policy).
2. Attached the IAM Role to the running EC2 instance (without storing any `AWS_ACCESS_KEY_ID` on the server).
3. SSHed into the EC2 instance and ran AWS CLI S3 commands to verify seamless temporary credential authentication via IMDSv2.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `aws sts get-caller-identity` | Confirms the EC2 instance is authenticated via the attached `assumed-role/EC2-S3-Access-Role`. |
| `aws s3 ls` | Lists S3 buckets directly from EC2 using the IAM role without hardcoded keys. |
| `aws s3 ls s3://<BUCKET-NAME>` | Verifies object-level read access granted by the IAM role. |

## Deliverables
- Terminal screenshot showing `aws sts get-caller-identity` and `aws s3 ls` CLI test output (`screenshots/`)
