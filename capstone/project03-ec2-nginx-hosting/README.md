# Project 03: Automated Nginx Web Server Hosting on EC2 via Terraform

## 1. Project Overview & Goal
Terraform ke zariye AWS EC2 Ubuntu virtual machine aur Security Group provision karke us par high-performance **Nginx Web Server** deploy karna aur default web traffic serve karna.

## 2. Files in This Folder
- `provider.tf` — AWS region (`ap-south-1`) provider block.
- `main.tf` — Security Group (Ports 22 & 80) aur EC2 instance (Nginx installation user-data ke saath) define karta hai.
- `outputs.tf` — Provisioned EC2 instance ka Public IPv4 address print karta hai.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Infrastructure Definition (`main.tf`):** Ubuntu EC2 instance ke saath HTTP (Port 80) aur SSH (Port 22) firewall rules configure kiye.
2. **Automated Nginx Setup:** Instance boot script mein `apt update && apt install -y nginx` aur service enablement add ki.
3. **Apply & Live Check:** `terraform apply` run karke Public IP par Nginx landing page verify kiya.

## 4. Commands Executed & Unka Kaam
1. `cd capstone/project03-ec2-nginx-hosting && terraform init`
   - **Kaam:** Terraform working directory aur AWS provider plugins setup karta hai.
2. `terraform validate && terraform plan`
   - **Kaam:** Configuration syntax check karke resources creation plan dikhata hai.
3. `terraform apply -auto-approve`
   - **Kaam:** AWS par EC2 instance launch karta hai aur Nginx web server start karta hai.
4. `curl -i http://<EC2_PUBLIC_IP>`
   - **Kaam:** Nginx server ke Public IP par HTTP `200 OK` response verify karta hai.

## 5. Expected Output / Verification
- Public IP par `curl` karne par `Server: nginx` header ke saath `HTTP/1.1 200 OK` response milta hai.
