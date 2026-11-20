# Project 7: CI/CD Pipeline Using GitHub Actions

## Maine Kya-Kya Kiya (Steps Performed)

1. **GitHub Actions Workflow File Banayi:**
   - Repository ke `.github/workflows/` folder mein CI/CD pipeline configuration file (`ci.yml`) create ki.
   - Pipeline ko `main` branch par har `push` aur `pull_request` event par automatically trigger hone ke liye configure kiya.

2. **Automated Build & Validation Steps Configure Kiye:**
   - Workflow mein code checkout (`actions/checkout@v4`), environment setup, Terraform configuration validation (`terraform fmt -check`, `terraform validate`), aur Docker image build checks add kiye.

3. **Pipeline Execution & Verification:**
   - Changes commit karke `main` branch par push kiye:
     ```bash
     git add .github/workflows/
     git commit -m "ci: add GitHub Actions CI/CD workflow"
     git push origin main
     ```
   - GitHub ke **Actions** tab mein workflow run monitor kiya aur green checkmark (all checks passed) verify kiya.
