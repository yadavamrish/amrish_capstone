# Project 12: Infrastructure CI Trigger (Terraform Plan)

## Goal
Automatically run `terraform plan` inside a CI pipeline on every push to preview infrastructure changes before applying.

## Steps Performed
1. Configured a GitHub Actions workflow (`.github/workflows/terraform-plan.yml`) triggered on push/PR events.
2. Added AWS credentials via GitHub Encrypted Secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`).
3. Configured pipeline steps to run `terraform init`, `terraform validate`, and `terraform plan -no-color`.
4. Verified successful execution and plan output in the GitHub Actions job logs.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `terraform init` | Initializes backend and AWS provider inside the CI runner. |
| `terraform plan -no-color` | Generates a clean, readable execution plan showing resources to add/change/destroy. |
| `git push origin main` | Triggers the automated CI pipeline run on GitHub. |

## Deliverables
- GitHub Actions job success screenshot displaying `terraform plan` output (`screenshots/`)
