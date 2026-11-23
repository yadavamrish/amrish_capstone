# Project 4: IAM User Automation with Terraform

## Goal
Automate IAM user creation with controlled Amazon S3 read-only permissions using Terraform variables.

## Steps Performed
1. Stored the S3 Read-Only policy ARN (`arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess`) inside a Terraform variable (`variables.tf`).
2. Created an `aws_iam_user` resource and attached the policy via `aws_iam_user_policy_attachment`.
3. Generated programmatic access keys (`aws_iam_access_key`) for testing.
4. Tested that S3 list/read commands succeed while S3 write/delete or EC2 actions are denied.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `terraform apply -auto-approve` | Creates the IAM user and attaches the variable-driven S3 read policy. |
| `aws configure --profile test-iam-user` | Configures AWS CLI credentials for the newly created IAM user. |
| `aws s3 ls --profile test-iam-user` | Tests allowed S3 read/list permission (succeeds). |
| `aws s3 mb s3://unauthorized-test-bucket --profile test-iam-user` | Tests restricted write permission (returns `AccessDenied` proof). |

## Deliverables
- Terraform repository link
- CLI test evidence screenshot (`screenshots/`)
