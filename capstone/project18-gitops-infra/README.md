# Project 18: GitOps Infra Deployment

## Steps Performed

1. **GitOps Workflow & Apply Job Configuration:**
   - Configured `.github/workflows/project18-gitops-deploy.yml` to trigger on merged Pull Requests targeting `main`.
   - Defined `terraform-plan` and `terraform-apply` jobs for automated infrastructure provisioning.

2. **Manual Approval Gate & PR Merge Execution:**
   - Configured the `production-approval` GitHub Environment with required reviewers to enforce manual approval before `terraform apply`.
   - Merged an infrastructure update PR into `main`, approved the deployment gate, and captured the workflow run screenshot.
