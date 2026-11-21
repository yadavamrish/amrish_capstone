# Project 04: Custom AWS VPC & Subnet Networking via Terraform

## 1. Project Overview & Goal
The goal of this project is to design and provision an isolated custom **AWS Virtual Private Cloud (VPC)** using **Terraform**, complete with custom CIDR blocks, public/private subnets, an Internet Gateway (IGW), and custom Route Tables.

## 2. Files in This Folder
- `provider.tf` — Configures the AWS provider (`ap-south-1`).
- `variables.tf` — Parameterizes VPC CIDR (`10.0.0.0/16`), subnet CIDRs, and Availability Zones.
- `main.tf` — Provisions the VPC, Subnets, Internet Gateway, Route Table, and Route Table Associations.
- `outputs.tf` — Outputs the created `vpc_id` and `subnet_ids`.

## 3. Step-by-Step Implementation
1. **Isolated VPC Creation:** Defined a custom VPC with DNS hostname resolution enabled.
2. **Subnet & Gateway Routing:** Created subnets across Availability Zones, attached an Internet Gateway, and routed `0.0.0.0/0` outbound traffic through a custom public Route Table.
3. **Deployment & Output Verification:** Provisioned the network stack via Terraform and verified all resource IDs.

## 4. Commands Executed & Purpose
1. `cd capstone/project04-vpc-custom-networking && terraform init`
   - **Purpose:** Initializes the Terraform network configuration workspace.
2. `terraform validate && terraform plan`
   - **Purpose:** Validates VPC, subnet, IGW, and route table definitions prior to deployment.
3. `terraform apply -auto-approve`
   - **Purpose:** Creates the custom VPC networking stack in AWS.
4. `terraform output`
   - **Purpose:** Displays the provisioned `vpc_id` and `subnet_ids` in the terminal.

## 5. Expected Output & Verification
- AWS VPC Console and `terraform output` confirm active custom VPC, subnets, attached Internet Gateway, and associated Route Tables.
