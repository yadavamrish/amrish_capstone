# Project 12: Infrastructure CI Trigger (Terraform Plan)

## Goal
Automatically validate and plan `capstone/project12-infrastructure-ci-trigger-terraform-plan/main.tf` in a CI pipeline to preview infrastructure changes before applying.

## Steps Performed
1. Configured a GitHub Actions workflow (`.github/workflows/terraform-plan.yml`) triggered by relevant pushes to `main` or manually.
2. Configured pipeline steps to initialize the local provider, validate the configuration, and generate a plan.
3. Uploaded the generated plan as `terraform-plan-artifact`.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `cd capstone/project12-infrastructure-ci-trigger-terraform-plan && terraform init -backend=false` | Initializes Terraform providers without configuring a backend. |
| `terraform validate` | Validates the Terraform configuration. |
| `terraform plan -refresh=false -out=tfplan` | Generates a binary execution plan for upload. |
| `git push origin main` | Triggers the pipeline when relevant paths have changed. |

## Deliverables
- The `terraform-plan-artifact` plan and GitHub Actions job output.
- GitHub Actions job success screenshot displaying `terraform plan` output (`screenshots/`).
