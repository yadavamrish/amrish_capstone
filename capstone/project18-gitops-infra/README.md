# Project 18: GitOps Infra Deployment

## Project Goal
GitOps workflow implement karna jismein `capstone/project18-gitops-infra/main.tf` ke infrastructure changes Pull Request merge hone par GitHub Actions (`.github/workflows/project18-gitops-deploy.yml`) ke through automatically `Terraform Plan` aur `Production Approval` gate ke baad `Terraform Apply` hon.

## Kya & Kaise Kiya
1. **GitOps Terraform Manifest (`main.tf`):** Declarative AWS infrastructure resource `capstone/project18-gitops-infra/main.tf` mein define kiya.
2. **GitHub Actions GitOps Workflow (`.github/workflows/project18-gitops-deploy.yml`):** `main` branch par PR merge hone par `terraform-plan` job aur `production-approval` environment gate ke baad `terraform-apply` job configure kiya.

## Commands Used & Unka Kaam
1. `cd capstone/project18-gitops-infra && terraform init && terraform validate`
   - **Kaam:** `main.tf` ke Terraform providers aur syntax ko initialize aur validate karta hai.
2. `terraform plan -out=tfplan`
   - **Kaam:** PR merge ke baad deployment se pehle execution plan (`tfplan`) generate karta hai.
3. `terraform apply -auto-approve`
   - **Kaam:** `production-approval` gate approve hone par AWS par infrastructure changes apply karta hai.
