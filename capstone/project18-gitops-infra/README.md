# Project 18: GitOps Infrastructure Deployment with Approval Gates

## 1. Project Overview & Goal
**GitOps** deployment model implement karna jahan `capstone/project18-gitops-infra/main.tf` ke infrastructure changes Pull Request merge hone par GitHub Actions (`.github/workflows/project18-gitops-deploy.yml`) ke zariye pehle automated `Terraform Plan` check karte hain aur phir `Production Approval` environment gate pass hone ke baad apply hote hain.

## 2. Files in This Folder & Workflow
- `main.tf` — GitOps workflow ke through manage hone wala Terraform infrastructure code.
- `.github/workflows/project18-gitops-deploy.yml` — Two-stage GitOps workflow (`terraform-plan` pre-approval check + `terraform-apply` with `production-approval` gate).

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Declarative Infra Setup (`main.tf`):** Infrastructure state ko Git repository mein single source of truth ke roop mein rakha.
2. **Approval-Gated CI/CD Workflow:** Pull Request `main` par merge hone (ya `workflow_dispatch`) par plan aur production approval pipeline configure ki.

## 4. Commands Executed & Unka Kaam
1. `cd capstone/project18-gitops-infra && terraform init -backend=false && terraform validate`
   - **Kaam:** `main.tf` ke Terraform providers aur syntax ko validate karta hai.
2. `terraform plan -refresh=false -out=tfplan`
   - **Kaam:** Pre-approval stage mein infrastructure execution plan generate karta hai.
3. `terraform apply -auto-approve`
   - **Kaam:** Production environment approval milne par AWS infrastructure changes apply karta hai.

## 5. Expected Output / Verification
- GitHub Actions mein `Terraform Plan (Pre-Approval Check)` pass hone ke baad `Terraform Apply` production approval gate ke saath execute hota hai.
