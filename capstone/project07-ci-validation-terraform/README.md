# Project 7: CI Validation for Terraform

![Terraform CI Validation](https://github.com/yadavamrish/amrish_capstone/actions/workflows/terraform-ci.yml/badge.svg)

## Goal
Automate Infrastructure as Code (IaC) formatting and validation checks on every push using GitHub Actions.

## Steps Performed
1. Created a GitHub Actions workflow file (`.github/workflows/terraform-ci.yml`) triggered on `push` events.
2. Configured workflow steps to checkout code, setup Terraform CLI, run `terraform fmt -check`, `terraform init -backend=false`, and `terraform validate`.
3. Added the live GitHub Actions workflow status badge to `README.md` and pushed changes to trigger the pipeline.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `terraform fmt -check -recursive` | Fails the CI pipeline if any `.tf` file is not properly formatted. |
| `terraform init -backend=false` | Initializes Terraform plugins in CI without requiring remote AWS credentials. |
| `terraform validate` | Validates Terraform syntax and resource attribute configurations automatically. |
| `git add . && git commit -m "Add Terraform CI" && git push` | Pushes workflow and Terraform code to trigger the GitHub Actions pipeline. |

## Deliverables
- Passing GitHub Actions CI pipeline screenshot (`screenshots/`)
- Workflow status badge in `README.md`
