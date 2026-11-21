# Project 01: Terraform Webserver

## Project Goal
Terraform HCL (`ec2.tf`, `security-group.tf`, `provider.tf`, `variables.tf`, `outputs.tf`) aur user-data bootstrap script (`scripts/install_apache.sh`) ke through AWS par Apache Webserver provision karna aur custom webpage (`website/index.html`) host karna.

## Kya & Kaise Kiya
1. **Terraform Infrastructure Files (`terraform/`):** `provider.tf` mein AWS region (`ap-south-1`), `security-group.tf` mein HTTP (Port 80) & SSH (Port 22) ingress rules, aur `ec2.tf` mein EC2 instance define kiya.
2. **Bootstrap Script & Webpage:** `scripts/install_apache.sh` ke zariye boot time par Apache (`httpd`/`apache2`) install karke `website/index.html` deploy kiya.
3. **Terraform Execution:** `terraform init`, `terraform validate`, `terraform plan`, aur `terraform apply` run karke live webserver URL (`outputs.tf`) verify kiya.

## Commands Used & Unka Kaam
1. `cd capstone/project01-terraform-webserver/terraform && terraform init`
   - **Kaam:** Terraform working directory initialize karke AWS provider plugins download karta hai.
2. `terraform fmt -check && terraform validate`
   - **Kaam:** `.tf` files ki formatting aur syntax/resource configuration validate karta hai.
3. `terraform plan -var-file="terraform.tfvars"`
   - **Kaam:** `terraform.tfvars` values ke saath AWS par create hone wale resources ka execution plan dikhata hai.
4. `terraform apply -var-file="terraform.tfvars" -auto-approve`
   - **Kaam:** AWS par Security Group aur Apache EC2 Webserver provision karta hai aur Public IP output print karta hai.
5. `curl -i http://<EC2_PUBLIC_IP>`
   - **Kaam:** Deployed Apache webserver par HTTP request bhej kar `200 OK` aur `website/index.html` response verify karta hai.
