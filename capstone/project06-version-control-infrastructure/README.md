# Project 6: Version Control Infrastructure

## Goal
Track Terraform infrastructure changes cleanly using Git branches, commits, and Pull Requests on GitHub.

## Steps Performed
1. Created a dedicated feature branch from `main` for infrastructure updates.
2. Updated Terraform configuration (e.g., added resource tags/outputs) and committed changes with clear messages.
3. Pushed the branch to GitHub and raised a Pull Request (PR) for code review and merge.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `git checkout -b feature/update-infra` | Creates and switches to a new feature branch for safe isolation. |
| `git status` | Checks modified and untracked Terraform files. |
| `git add .` | Stages updated infrastructure files for commit. |
| `git commit -m "Update Terraform tags and variables"` | Records a versioned snapshot of infrastructure changes. |
| `git push -u origin feature/update-infra` | Pushes the feature branch to GitHub so a Pull Request can be raised. |

## Deliverables
- GitHub Pull Request (PR) link and screenshot (`screenshots/`)
