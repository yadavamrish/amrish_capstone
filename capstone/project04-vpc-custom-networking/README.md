# Project 04: Custom AWS VPC & Subnet Networking via Terraform

## 1. Project Overview & Goal
Default VPC par depend rehne ke bajay **Terraform** ke zariye ek isolated custom **Virtual Private Cloud (VPC)** design karna jismein custom CIDR blocks, public/private subnets, Internet Gateway (IGW), aur custom Route Tables configure hon.

## 2. Files in This Folder
- `provider.tf` — AWS Mumbai (`ap-south-1`) provider setup.
- `variables.tf` — VPC CIDR (`10.0.0.0/16`), subnet CIDRs, aur Availability Zones ke parameters.
- `main.tf` — VPC, Subnets, Internet Gateway, Route Table, aur Route Table Associations create karta hai.
- `outputs.tf` — Created `vpc_id` aur `subnet_ids` print karta hai.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Isolated Network Design:** `10.0.0.0/16` IPv4 range ke saath custom VPC banaya aur DNS hostnames enable kiye.
2. **Subnets & Internet Routing:** Subnets create karke Internet Gateway attach kiya aur `0.0.0.0/0` default internet route ko public route table ke through link kiya.
3. **Provisioning & Output Check:** `terraform apply` se poora network stack deploy karke IDs verify kiye.

## 4. Commands Executed & Unka Kaam
1. `cd capstone/project04-vpc-custom-networking && terraform init`
   - **Kaam:** Network Terraform module initialize karta hai.
2. `terraform validate && terraform plan`
   - **Kaam:** VPC, Subnets, IGW, aur Route Table rules validate karta hai.
3. `terraform apply -auto-approve`
   - **Kaam:** AWS par isolated custom VPC networking stack provision karta hai.
4. `terraform output`
   - **Kaam:** Created VPC ID aur Subnet IDs terminal par print karta hai.

## 5. Expected Output / Verification
- AWS VPC Console aur `terraform output` mein custom VPC, attached Internet Gateway, aur configured Route Tables active dikhte hain.
