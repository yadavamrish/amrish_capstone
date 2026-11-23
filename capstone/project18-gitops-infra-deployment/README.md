# Project 18: GitOps Infra Deployment

## Goal
Trigger automated Terraform infrastructure deployment (`terraform apply`) upon Pull Request merges into `main` with environment approval gates.

## Steps Performed
1. Configured a GitHub Environment (`production`) with Required Reviewers enabled for manual approval.
2. Created a GitHub Actions GitOps workflow triggered when a Pull Request is merged into `main`.
3. Configured the workflow to run `terraform plan`, pause for reviewer approval, and execute `terraform apply -auto-approve`.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `terraform init` | Initializes the remote state backend and AWS provider. |
| `terraform apply -auto-approve` | Automatically applies merged infrastructure changes after approval. |
| `git checkout main && git pull` | Syncs local repository after PR merge triggers the GitOps pipeline. |

## Deliverables
- GitHub Actions GitOps workflow run and approval screenshot (`screenshots/`)
