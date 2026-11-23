# Project 12: Automated Terraform Plan CI with GitHub Actions

## 1. Project Overview & Goal
The goal of this project is to automate Terraform validation and execution plan generation on every push to `main` using a **GitHub Actions CI Workflow** (`.github/workflows/terraform-plan.yml`) targeting `capstone/project12-infrastructure-ci-trigger-terraform-plan/main.tf`.

## 2. Files in This Folder & Workflow
- `main.tf` — Declarative Terraform infrastructure definition validated by the CI pipeline.
- `.github/workflows/terraform-plan.yml` — Path-triggered GitHub Actions workflow running `terraform init`, `terraform validate`, `terraform plan -out=tfplan`, and artifact upload.

## 3. Step-by-Step Implementation
1. **Terraform Configuration (`main.tf`):** Authored clean HCL infrastructure resources inside `capstone/project12-infrastructure-ci-trigger-terraform-plan/main.tf`.
2. **GitHub Actions CI Pipeline:** Configured `hashicorp/setup-terraform@v3` to initialize providers, validate syntax, generate `tfplan`, and upload the plan artifact via `actions/upload-artifact@v4`.
3. **CI Execution Verification:** Pushed changes to `main` and verified green checkmarks in the GitHub Actions workflow run.

## 4. Commands Executed & Purpose
1. `cd capstone/project12-infrastructure-ci-trigger-terraform-plan && terraform init -backend=false`
   - **Purpose:** Initializes Terraform providers on the CI runner without requiring remote backend credentials.
2. `terraform validate`
   - **Purpose:** Validates HCL syntax and resource configurations inside `main.tf`.
3. `terraform plan -refresh=false -out=tfplan`
   - **Purpose:** Generates a binary Terraform execution plan artifact (`tfplan`).

## 5. Expected Output & Verification
- The **Project 12 - Terraform Plan CI** GitHub Actions workflow completes with a green checkmark (`✓`) and uploads `terraform-plan-artifact`.
