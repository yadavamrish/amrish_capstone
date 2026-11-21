# Project 03: EC2 Nginx Hosting

## Project Goal
Terraform (`main.tf`, `provider.tf`, `outputs.tf`) ke through AWS EC2 instance provision karke us par Nginx web server deploy aur host karna.

## Kya & Kaise Kiya
1. **EC2 & Security Group Manifest (`main.tf`):** Ubuntu EC2 instance, Port 22 & Port 80 Security Group, aur Nginx installation setup define kiya.
2. **Provisioning & Output Verification:** `terraform apply` run karke `outputs.tf` se EC2 Public IP nikala aur live Nginx page verify kiya.

## Commands Used & Unka Kaam
1. `cd capstone/project03-ec2-nginx-hosting && terraform init`
   - **Kaam:** Terraform provider plugins initialize karta hai.
2. `terraform validate && terraform plan`
   - **Kaam:** `main.tf` aur `outputs.tf` configuration validate karke execution preview dikhata hai.
3. `terraform apply -auto-approve`
   - **Kaam:** AWS par EC2 instance launch karke Nginx web server host karta hai.
4. `curl -i http://<EC2_PUBLIC_IP>`
   - **Kaam:** Nginx server ke Public IP par `200 OK` HTTP response verify karta hai.
