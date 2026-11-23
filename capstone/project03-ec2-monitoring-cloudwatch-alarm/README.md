# Project 03: Automated Nginx Web Server Hosting on EC2 via Terraform

## 1. Project Overview & Goal
The goal of this project is to provision an Ubuntu EC2 instance and Security Group on AWS using **Terraform** and automatically install and start the **Nginx Web Server** to serve HTTP traffic on Port 80.

## 2. Files in This Folder
- `provider.tf` — Configures the AWS provider in `ap-south-1`.
- `main.tf` — Defines the EC2 instance, Security Group (`Port 22` & `Port 80`), and user-data script to install and enable Nginx.
- `outputs.tf` — Exports the Public IP address of the Nginx web server.

## 3. Step-by-Step Implementation
1. **Infrastructure & Firewall Definition:** Configured an Ubuntu EC2 instance paired with a Security Group permitting inbound SSH (`22`) and HTTP (`80`) traffic.
2. **Automated Nginx Bootstrap:** Included user-data commands to update system packages, install `nginx`, and enable the systemd service on startup.
3. **Provisioning & HTTP Verification:** Applied the Terraform stack and confirmed Nginx availability over HTTP.

## 4. Commands Executed & Purpose
1. `cd capstone/project03-ec2-nginx-hosting && terraform init`
   - **Purpose:** Initializes the Terraform workspace and provider dependencies.
2. `terraform validate && terraform plan`
   - **Purpose:** Checks HCL syntax and previews the EC2 and Security Group creation plan.
3. `terraform apply -auto-approve`
   - **Purpose:** Launches the EC2 instance on AWS and installs the Nginx web server.
4. `curl -i http://<EC2_PUBLIC_IP>`
   - **Purpose:** Confirms `Server: nginx` headers and an `HTTP 200 OK` response on the instance's Public IP.

## 5. Expected Output & Verification
- `curl -i http://<EC2_PUBLIC_IP>` returns `HTTP/1.1 200 OK` with Nginx serving the landing page.
