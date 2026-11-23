# Project 11: Infra Changes with Branching Policy

## Goal
Enforce a structured Git branching strategy where infrastructure changes are developed in feature branches and merged via Pull Request review.

## Steps Performed
1. Protected the `main` branch on GitHub to require Pull Request reviews before merging.
2. Created a feature branch (`feature/network-update`), modified infrastructure code, and pushed it to GitHub.
3. Opened a Pull Request, reviewed the diff, approved, and merged changes into `main`.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `git checkout -b feature/network-update` | Creates an isolated branch for infrastructure modifications. |
| `git diff` | Reviews exact line-by-line changes before committing. |
| `git add . && git commit -m "feat: add security group rules"` | Commits infrastructure changes cleanly to the feature branch. |
| `git push -u origin feature/network-update` | Pushes the feature branch to GitHub to initiate PR review. |

## Deliverables
- Screenshots of Pull Request creation, review, and successful merge (`screenshots/`)
