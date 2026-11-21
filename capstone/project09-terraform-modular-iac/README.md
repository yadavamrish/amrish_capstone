# Project 09: Infrastructure as Code (IaC) with Terraform

## Project Goal
Manual console clicks ke bajay declarative Terraform (HCL) configuration files ke through AWS Mumbai (`ap-south-1`) infrastructure ko repeatable aur version-controlled tareeke se provision karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Terraform Configuration (`main.tf`, `variables.tf`, `outputs.tf`):** AWS provider (`ap-south-1`), custom Security Group, aur Ubuntu EC2 instance resources define kiye.
2. **Execution Plan & Apply:** `terraform init` se AWS provider plugins download kiye, `terraform plan` se changes preview kiye, aur `terraform apply` se live infrastructure provision kiya.
3. **State & Cleanup Management:** `terraform output` se Public IP verify kiya aur cost control ke liye `terraform destroy` se lifecycle test complete kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `terraform init`
   - **Kaam:** Working directory ko initialize karta hai aur `main.tf` mein specified AWS provider plugins download karta hai.
2. `terraform fmt -check && terraform validate`
   - **Kaam:** Terraform `.tf` files ki formatting check karta hai aur HCL syntax/configuration errors validate karta hai.
3. `terraform plan -out=tfplan`
   - **Kaam:** Current AWS state aur desired `.tf` code ko compare karke exact resources creation/modification ka dry-run plan dikhata hai.
4. `terraform apply "tfplan"`
   - **Kaam:** Approved execution plan ke mutabik AWS par actual resources (VPC, SG, EC2) create karta hai aur `terraform.tfstate` update karta hai.
5. `terraform output`
   - **Kaam:** Provisioned resources ke output values (jaise EC2 Public IP aur Instance ID) terminal par print karta hai.
6. `terraform destroy -auto-approve`
   - **Kaam:** Terraform state file mein tracked sabhi AWS resources ko ek command mein cleanly terminate aur delete karta hai.
