# Project 02: Serverless S3 Static Website Hosting via Terraform

## 1. Project Overview & Goal
The goal of this project is to host a serverless, highly available static website on **Amazon S3** without managing any backend compute instances, automating bucket creation, public read policies, website configuration, and object upload via **Terraform**.

## 2. Files in This Folder
- `provider.tf` — Configures the AWS provider for `ap-south-1`.
- `main.tf` — Defines the S3 bucket, disables public access blocks, attaches a public `s3:GetObject` bucket policy, enables static website hosting, and uploads `index.html`.
- `outputs.tf` — Outputs the live S3 static website endpoint URL.
- `index.html` — Static HTML webpage hosted inside the S3 bucket.

## 3. Step-by-Step Implementation
1. **Bucket & Public Access Policy:** Defined a globally unique S3 bucket in `main.tf`, disabled default public access restrictions, and attached a JSON bucket policy permitting anonymous read access to website files.
2. **Static Website Configuration:** Enabled S3 static website hosting with `index.html` configured as the default index document.
3. **Deployment & Endpoint Validation:** Applied the Terraform configuration and verified live HTTP delivery over the S3 website endpoint.

## 4. Commands Executed & Purpose
1. `cd capstone/project02-s3-static-website && terraform init`
   - **Purpose:** Initializes Terraform and downloads the AWS provider plugin.
2. `terraform validate && terraform plan`
   - **Purpose:** Validates S3 resource definitions and previews planned infrastructure changes.
3. `terraform apply -auto-approve`
   - **Purpose:** Creates the S3 bucket, configures static website hosting, applies the bucket policy, and uploads `index.html`.
4. `curl -i http://<S3_WEBSITE_ENDPOINT>`
   - **Purpose:** Verifies that the S3 website endpoint serves `index.html` with an `HTTP 200 OK` status.

## 5. Expected Output & Verification
- Navigating to the S3 website endpoint URL printed by `terraform output` loads `index.html` cleanly with `HTTP/1.1 200 OK`.
