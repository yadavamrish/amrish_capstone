# Project 09: Terraform Modular IaC

## Project Goal
Reusable Terraform modules (`network`, `compute`, `security`) structure design karna taaki multi-environment AWS infrastructure DRY (Don't Repeat Yourself) principle ke saath deploy ho sake.

## Kya & Kaise Kiya
1. **Modular Architecture:** Root configuration se child modules ko input variables pass karke output attributes export kiye.
2. **Validation & Plan:** `terraform init` ke through local modules register karke `terraform validate` aur `terraform plan` execute kiya.

## Commands Used & Unka Kaam
1. `terraform init`
   - **Kaam:** Root aur child Terraform modules ko initialize aur link karta hai.
2. `terraform fmt -recursive && terraform validate`
   - **Kaam:** Sabhi modular `.tf` files ko format aur validate karta hai.
3. `terraform plan`
   - **Kaam:** Modular infrastructure stack ka execution plan generate karta hai.
