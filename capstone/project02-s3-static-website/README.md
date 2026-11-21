# Project 02: Serverless S3 Static Website Hosting via Terraform

## 1. Project Overview & Goal
Bina kisi EC2 server ko manage kiye **Amazon S3** par ek serverless, cost-effective static website host karna aur poora S3 bucket + public bucket policy + website configuration **Terraform** se automate karna.

## 2. Files in This Folder
- `provider.tf` — AWS Mumbai (`ap-south-1`) provider setup.
- `main.tf` — S3 bucket, public access block settings, public read bucket policy (`s3:GetObject`), static website hosting configuration, aur `index.html` object upload define karta hai.
- `outputs.tf` — Created S3 bucket ka live HTTP website endpoint URL output karta hai.
- `index.html` — S3 par host hone wala static webpage.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **S3 Bucket & Access Policy in HCL:** `main.tf` mein globally unique S3 bucket banaya, public access block disable kiya, aur public read policy attach ki taaki web visitors `index.html` read kar sakein.
2. **Website Hosting Enablement:** `aws_s3_bucket_website_configuration` resource se `index.html` ko default index document set kiya.
3. **Deployment & Verification:** `terraform apply` se bucket deploy karke S3 website URL par live site check ki.

## 4. Commands Executed & Unka Kaam
1. `cd capstone/project02-s3-static-website && terraform init`
   - **Kaam:** S3 project directory mein Terraform initialize karta hai.
2. `terraform validate && terraform plan`
   - **Kaam:** S3 bucket aur policy configuration validate karke execution plan dikhata hai.
3. `terraform apply -auto-approve`
   - **Kaam:** AWS par S3 bucket create karta hai, website hosting on karta hai, aur `index.html` upload karta hai.
4. `curl -i http://<S3_WEBSITE_ENDPOINT>`
   - **Kaam:** S3 static website endpoint par HTTP request bhej kar `200 OK` aur live HTML content verify karta hai.

## 5. Expected Output / Verification
- `terraform output` se mila S3 website URL browser aur `curl` dono mein bina kisi error ke `200 OK` ke saath `index.html` serve karta hai.
