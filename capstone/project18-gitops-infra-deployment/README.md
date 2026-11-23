# Project 18: GitOps Infrastructure Deployment with Approval Gates

## 1. Project Overview & Goal
The goal of this project is to implement a **GitOps** infrastructure delivery workflow where changes to `capstone/project18-gitops-infra/main.tf` merged via Pull Request automatically trigger a pre-approval `Terraform Plan` check followed by an environment-gated (`production-approval`) `Terraform Apply` via GitHub Actions (`.github/workflows/project18-gitops-deploy.yml`).

## 2. Files in This Folder & Workflow
- `main.tf` — Declarative Terraform infrastructure definition managed through GitOps Pull Requests.
- `.github/workflows/project18-gitops-deploy.yml` — Two-stage GitHub Actions workflow (`terraform-plan` pre-approval check + `terraform-apply` behind the `production-approval` environment gate).

## 3. Step-by-Step Implementation
1. **Git as Single Source of Truth (`main.tf`):** Stored infrastructure definitions in Git under `capstone/project18-gitops-infra/`.
2. **Approval-Gated GitOps Pipeline:** Configured automated plan validation upon PR merge to `main`, requiring explicit environment approval before applying changes.

## 4. Commands Executed & Purpose
1. `cd capstone/project18-gitops-infra && terraform init -backend=false && terraform validate`
   - **Purpose:** Initializes Terraform providers and validates HCL syntax in `main.tf`.
2. `terraform plan -refresh=false -out=tfplan`
   - **Purpose:** Generates a pre-approval execution plan (`tfplan`) upon PR merge.
3. `terraform apply -auto-approve`
   - **Purpose:** Applies validated infrastructure changes once `production-approval` is granted.

## 5. Expected Output & Verification
- GitHub Actions runs **Project 18 - GitOps Infra Deployment**, passes the pre-approval plan job, and pauses for `production-approval` before applying.
