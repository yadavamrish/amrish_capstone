# Project 1: Deploy a Linux EC2 Web Server using Terraform

## Goal
Create a Linux web server on AWS using Infrastructure as Code (Terraform) and host a test webpage.

## Steps Performed
1. Wrote Terraform configuration (`main.tf`, `variables.tf`, `outputs.tf`) to provision a custom VPC, public Subnet, Internet Gateway, Route Table, Security Group (allowing SSH 22 & HTTP 80), and an EC2 instance.
2. Added a `user_data` Bash script to automatically install and start Nginx/Apache and deploy a custom `index.html` webpage.
3. Initialized, planned, and applied the Terraform stack to deploy the infrastructure.
4. Verified webpage accessibility via the EC2 Public IP in a browser.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `terraform init` | Initializes the Terraform working directory and downloads the AWS provider plugin. |
| `terraform fmt` | Formats Terraform configuration files into canonical style. |
| `terraform validate` | Checks syntax and internal consistency of Terraform files. |
| `terraform plan` | Previews all AWS resources (VPC, Subnet, SG, EC2) that will be created. |
| `terraform apply -auto-approve` | Provisions the infrastructure on AWS without manual confirmation prompts. |
| `curl -I http://<EC2-PUBLIC-IP>` | Verifies that the web server responds with `HTTP 200 OK`. |

## Deliverables
- Terraform code in GitHub repository (`main.tf`, `variables.tf`, `outputs.tf`)
- Screenshot of live hosted webpage (`screenshots/`)
