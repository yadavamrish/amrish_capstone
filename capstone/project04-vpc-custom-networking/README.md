# Project 04: VPC Custom Networking

## Project Goal
Terraform (`main.tf`, `provider.tf`, `variables.tf`, `outputs.tf`) ke through isolated custom AWS VPC, public/private subnets, Internet Gateway, aur Route Tables provision karna.

## Kya & Kaise Kiya
1. **Parameterized Network Variables (`variables.tf` & `main.tf`):** Custom VPC CIDR, subnets, Internet Gateway, aur route table associations ko Terraform HCL mein define kiya.
2. **Infrastructure Deployment:** `terraform apply` execute karke VPC ID aur Subnet IDs ko `outputs.tf` ke through verify kiya.

## Commands Used & Unka Kaam
1. `cd capstone/project04-vpc-custom-networking && terraform init`
   - **Kaam:** Custom VPC Terraform module directory initialize karta hai.
2. `terraform validate && terraform plan`
   - **Kaam:** VPC, Subnets, IGW, aur Route Table definitions ko validate karta hai.
3. `terraform apply -auto-approve`
   - **Kaam:** AWS par complete isolated custom VPC network stack create karta hai.
4. `terraform output`
   - **Kaam:** Created `vpc_id` aur `subnet_ids` ke output values terminal par print karta hai.
