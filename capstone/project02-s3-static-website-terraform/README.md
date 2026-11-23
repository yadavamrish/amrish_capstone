# Project 2: Host a Static Website on Amazon S3 using Terraform

## Goal
Publish a publicly accessible static website on Amazon S3 using Terraform.

## Steps Performed
1. Defined an `aws_s3_bucket` resource in Terraform with a globally unique bucket name.
2. Disabled Block Public Access settings and attached a public-read `aws_s3_bucket_policy` (`s3:GetObject`).
3. Configured `aws_s3_bucket_website_configuration` with `index.html` as the index document.
4. Uploaded `index.html` using `aws_s3_object` and tested the S3 website endpoint URL.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `terraform init` | Downloads the AWS provider and prepares the backend. |
| `terraform apply -auto-approve` | Creates the S3 bucket, configures static website hosting, applies bucket policy, and uploads `index.html`. |
| `terraform output website_endpoint` | Displays the public S3 static website URL. |
| `curl -I http://<S3-WEBSITE-ENDPOINT>` | Confirms public HTTP access to the hosted static website. |

## Deliverables
- Terraform repository link
- Screenshot of live S3 website (`screenshots/`)
