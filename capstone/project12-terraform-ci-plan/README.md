# Project 12: Terraform CI Plan

## Project Goal
GitHub Actions workflow (`.github/workflows/terraform-plan.yml`) ke through `capstone/project12-terraform-ci-plan/main.tf` par har push par automated `terraform init`, `terraform validate`, aur `terraform plan` CI check execute karna.

## Kya & Kaise Kiya
1. **Terraform Configuration (`main.tf`):** `capstone/project12-terraform-ci-plan/main.tf` mein declarative AWS infrastructure resource define kiya.
2. **Automated GitHub Actions CI (`.github/workflows/terraform-plan.yml`):** `main` branch par changes push hote hi `hashicorp/setup-terraform@v3` ke saath automated validation aur plan generation configure kiya.

## Commands Used & Unka Kaam
1. `cd capstone/project12-terraform-ci-plan && terraform init -backend=false`
   - **Kaam:** CI runner par remote state backend ke bina Terraform providers initialize karta hai.
2. `terraform validate`
   - **Kaam:** `main.tf` ke HCL syntax aur resource arguments ko validate karta hai.
3. `terraform plan -out=tfplan`
   - **Kaam:** Infrastructure execution plan (`tfplan`) generate karta hai jise CI artifact ke roop mein upload kiya jata hai.
