# Project 1: Deploy a Linux EC2 Web Server using Terraform

**GitHub Repository Link:** [https://github.com/yadavamrish/amrish_capstone/tree/main/capstone/project01-linux-ec2-webserver-terraform](https://github.com/yadavamrish/amrish_capstone/tree/main/capstone/project01-linux-ec2-webserver-terraform)

## Overview
This project provisions an isolated AWS networking stack and a Linux web server using **Terraform (Infrastructure as Code)**. To comply with strict security policies where standard ports **22 (SSH)** and **80 (HTTP)** are restricted, the web server is configured to serve traffic on custom port **8080** and relies on **AWS Systems Manager (SSM) Session Manager** for keyless, portless instance access instead of opening inbound SSH port 22.

## Architecture & Components
* **Custom VPC & Public Subnet:** Isolated virtual network (`10.0.0.0/16`) with public IP assignment enabled on the subnet (`10.0.1.0/24`).
* **Internet Gateway & Route Table:** Routes outbound and inbound internet traffic (`0.0.0.0/0`) to the public subnet.
* **Security Group (Restricted Policy Compliant):**
  * **Inbound:** Allows custom web traffic only on **TCP Port 8080** (ports `22` and `80` remain closed/restricted).
  * **Outbound:** Allows HTTPS/package downloads (`0.0.0.0/0`) for initial bootstrap and SSM agent communication.
* **EC2 Instance & Bootstrap (`user_data`):** Automatically installs Nginx/Apache via `user_data`, binds the listener to port **8080**, and deploys a custom `index.html` webpage.

## Steps Performed
1. Defined Terraform configuration files (`provider.tf`, `variables.tf`, `main.tf`, `outputs.tf`) with Security Group rules strictly avoiding ports `22` and `80`.
2. Configured the `user_data` Bash script to configure the web server on port `8080` and host the custom HTML page.
3. Executed `terraform init`, `terraform plan`, and `terraform apply -auto-approve` to provision the stack.
4. Verified the live webpage via `http://<EC2-PUBLIC-IP>:8080`.

## Proof Screenshots
* See `screenshots/` directory for Terraform apply output and live browser verification on port `8080`.
