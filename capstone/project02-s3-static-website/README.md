# Project 02: S3 Static Website

## Project Goal
Terraform (`main.tf`, `provider.tf`, `outputs.tf`) ke through Amazon S3 bucket provision karke serverless static website (`index.html`) host karna.

## Kya & Kaise Kiya
1. **Terraform S3 Configuration (`main.tf`):** S3 bucket resource, public access block configuration, public-read bucket policy, aur `index.html` object upload define kiya.
2. **Static Website Hosting:** S3 website endpoint configuration enable karke `outputs.tf` se live website URL output kiya.

## Commands Used & Unka Kaam
1. `cd capstone/project02-s3-static-website && terraform init`
   - **Kaam:** S3 project directory mein Terraform aur AWS provider initialize karta hai.
2. `terraform validate && terraform plan`
   - **Kaam:** S3 bucket aur website configuration syntax verify karke deployment plan dikhata hai.
3. `terraform apply -auto-approve`
   - **Kaam:** AWS par S3 bucket create karta hai, static website hosting enable karta hai, aur `index.html` upload karta hai.
4. `curl -i http://<S3_WEBSITE_ENDPOINT>`
   - **Kaam:** S3 static website endpoint par HTTP request bhej kar `200 OK` response verify karta hai.
