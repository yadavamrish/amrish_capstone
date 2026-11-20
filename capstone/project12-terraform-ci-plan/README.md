# Project 12: Infrastructure CI Trigger (Terraform Plan)

## Maine Kya-Kya Kiya (Steps Performed)

1. **Terraform Configuration Create Kiya:**
   - `capstone/project12-terraform-ci-plan/main.tf` mein `local` provider ke saath declarative infrastructure manifest define kiya (bina external cloud credentials ke).

2. **GitHub Actions CI Workflow Setup Kiya:**
   - `.github/workflows/terraform-plan.yml` create kiya jo `main` branch par har `push` event par automatically trigger hota hai.
   - Pipeline mein `terraform init`, `terraform validate`, aur `terraform plan -out=tfplan` steps configure kiye.

3. **Plan Artifact Upload Aur Verification:**
   - `actions/upload-artifact@v4` use karke generated `tfplan` file ko pipeline artifact ke roop mein upload kiya.
   - GitHub Actions tab mein job success (green checkmark) aur `terraform-plan-artifact` verify karke screenshot capture kiya.
