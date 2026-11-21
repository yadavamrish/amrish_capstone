# Project 01: Automated Apache Webserver Provisioning with Terraform

## 1. Project Overview & Goal
Is project ka goal AWS Mumbai (`ap-south-1`) region mein manual console clicks ke bajay **Terraform Infrastructure as Code (IaC)** ke through ek EC2 virtual server aur Security Group provision karna hai, aur boot time par user-data shell script ke zariye automatically **Apache Webserver** install karke custom webpage live karna hai.

## 2. Files in This Folder
- `terraform/provider.tf` — AWS provider aur `ap-south-1` region configure karta hai.
- `terraform/variables.tf` & `terraform/terraform.tfvars` — Instance type, AMI, aur project tags ke reusable variables store karta hai.
- `terraform/security-group.tf` — EC2 instance ke liye firewall rules (SSH Port 22 aur HTTP Port 80) define karta hai.
- `terraform/ec2.tf` — EC2 instance resource define karta hai aur boot time par `install_apache.sh` pass karta hai.
- `terraform/outputs.tf` — Server launch hone ke baad uska Public IP aur Website URL terminal par print karta hai.
- `scripts/install_apache.sh` — Ubuntu/Linux server par Apache web server install karke start karne wali bash script.
- `website/index.html` — Live web server par host hone wala custom HTML webpage.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **IaC Structure Design:** Terraform configuration ko clean modular files (`provider.tf`, `variables.tf`, `security-group.tf`, `ec2.tf`, `outputs.tf`) mein divide kiya.
2. **Firewall & Compute Configuration:** Security group mein port `80` (HTTP) aur `22` (SSH) open kiye aur `ec2.tf` mein `user_data` script attach ki taaki server boot hote hi Apache automatically setup ho jaye.
3. **Terraform Execution:** `init`, `fmt`, `validate`, `plan`, aur `apply` run karke AWS par live server deploy kiya aur browser/`curl` se webpage verify kiya.

## 4. Commands Executed & Unka Kaam
1. `cd capstone/project01-terraform-webserver/terraform && terraform init`
   - **Kaam:** Terraform directory initialize karke AWS provider plugins download karta hai.
2. `terraform fmt -check && terraform validate`
   - **Kaam:** Sabhi `.tf` files ki formatting check karta hai aur syntax/resource errors validate karta hai.
3. `terraform plan -var-file="terraform.tfvars"`
   - **Kaam:** AWS par kya resources create honge, uska dry-run preview dikhata hai.
4. `terraform apply -var-file="terraform.tfvars" -auto-approve`
   - **Kaam:** AWS par Security Group aur EC2 instance create karta hai aur Apache webserver install karata hai.
5. `curl -i http://<EC2_PUBLIC_IP>`
   - **Kaam:** Deployed server ke Public IP par HTTP request bhej kar `200 OK` status aur `website/index.html` content verify karta hai.

## 5. Expected Output / Verification
- `terraform apply` ke end mein `outputs.tf` ke zariye EC2 Public IP print hota hai aur `http://<EC2_PUBLIC_IP>` open karne par custom HTML webpage `HTTP 200 OK` ke saath load hota hai.
