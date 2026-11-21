# Project 12: Automated Terraform Plan CI with GitHub Actions

## 1. Project Overview & Goal
GitHub Actions CI workflow (`.github/workflows/terraform-plan.yml`) ke zariye har code push par `capstone/project12-terraform-ci-plan/main.tf` ko automatically initialize, validate, aur `terraform plan` execute karke plan artifact generate karna.

## 2. Files in This Folder & Workflow
- `main.tf` — Declarative Terraform infrastructure definition jo CI pipeline ke through validate hoti hai.
- `.github/workflows/terraform-plan.yml` — Path-triggered GitHub Actions workflow jo `terraform init`, `terraform validate`, `terraform plan -out=tfplan`, aur artifact upload automate karta hai.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Terraform Manifest (`main.tf`):** `capstone/project12-terraform-ci-plan/main.tf` mein AWS infrastructure configuration likhi.
2. **CI Pipeline Setup:** `hashicorp/setup-terraform@v3` action ke saath automated validation aur plan artifact upload (`actions/upload-artifact@v4`) configure kiya.
3. **Pipeline Verification:** Commit push karke GitHub Actions tab mein green pass status verify kiya.

## 4. Commands Executed & Unka Kaam
1. `cd capstone/project12-terraform-ci-plan && terraform init -backend=false`
   - **Kaam:** CI runner par remote state backend ke bina Terraform providers initialize karta hai.
2. `terraform validate`
   - **Kaam:** `main.tf` ke HCL syntax aur resource configuration ko validate karta hai.
3. `terraform plan -refresh=false -out=tfplan`
   - **Kaam:** Infrastructure changes ka binary execution plan (`tfplan`) generate karta hai.

## 5. Expected Output / Verification
- GitHub Actions mein **Project 12 - Terraform Plan CI** workflow green checkmark (`✓`) ke saath pass hota hai aur `terraform-plan-artifact` upload hota hai.
