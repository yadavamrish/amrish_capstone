# Project 01: Automated Apache Webserver Provisioning with Terraform

## 1. Project Overview & Goal
The goal of this project is to provision an AWS EC2 virtual machine and Security Group in the Mumbai (`ap-south-1`) region using **Terraform Infrastructure as Code (IaC)** instead of manual console clicks, and automatically install and configure an **Apache Webserver** at boot time via a user-data shell script to serve a custom HTML page.

## 2. Files in This Folder
- `terraform/provider.tf` — Configures the AWS Terraform provider and target region (`ap-south-1`).
- `terraform/variables.tf` & `terraform/terraform.tfvars` — Defines input variables and environment values (instance type, AMI, project tags).
- `terraform/security-group.tf` — Configures ingress/egress firewall rules allowing SSH (`Port 22`) and HTTP (`Port 80`).
- `terraform/ec2.tf` — Provisions the EC2 instance and injects `scripts/install_apache.sh` as boot-time user data.
- `terraform/outputs.tf` — Exports the provisioned EC2 Public IP and live website URL after deployment.
- `scripts/install_apache.sh` — Shell script that installs, enables, and starts the Apache web server on boot.
- `website/index.html` — Custom HTML landing page served by the Apache web server.

## 3. Step-by-Step Implementation
1. **Modular IaC Configuration:** Separated provider, variables, firewall rules, compute instance, and outputs into dedicated `.tf` files for clean maintainability.
2. **Firewall & Compute Setup:** Opened TCP ports `22` and `80` in the Security Group and attached the bootstrap script (`install_apache.sh`) to automatically deploy `website/index.html`.
3. **Provisioning & Verification:** Executed Terraform initialization, formatting, syntax validation, execution planning, and deployment, followed by HTTP endpoint verification.

## 4. Commands Executed & Purpose
1. `cd capstone/project01-terraform-webserver/terraform && terraform init`
   - **Purpose:** Initializes the Terraform working directory and downloads required AWS provider plugins.
2. `terraform fmt -check && terraform validate`
   - **Purpose:** Verifies canonical HCL formatting and validates configuration syntax and resource dependencies.
3. `terraform plan -var-file="terraform.tfvars"`
   - **Purpose:** Generates an execution preview showing exact AWS resources to be created using `terraform.tfvars`.
4. `terraform apply -var-file="terraform.tfvars" -auto-approve`
   - **Purpose:** Provisions the Security Group and EC2 instance on AWS and executes the Apache installation script.
5. `curl -i http://<EC2_PUBLIC_IP>`
   - **Purpose:** Sends an HTTP request to the provisioned server to verify an `HTTP 200 OK` response and custom HTML delivery.

## 5. Expected Output & Verification
- `terraform apply` outputs the assigned EC2 Public IPv4 address, and accessing `http://<EC2_PUBLIC_IP>` returns `HTTP/1.1 200 OK` with the custom webpage rendered.
