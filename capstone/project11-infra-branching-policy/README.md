# Project 11: Infrastructure Git Branching & Pull Request Policy

## 1. Project Overview & Goal
The goal of this project is to enforce a structured **Git Branching Strategy** (`main`, `feat/*`, `fix/*`) and Pull Request (PR) review workflow for the infrastructure repository (`amrish_capstone`) so that unreviewed changes never land directly on `main`.

## 2. Key Concepts Implemented
- Branch isolation between production (`main`) and active feature/fix branches.
- Pre-merge code review and automated CI status gates on Pull Requests.

## 3. Step-by-Step Implementation
1. **Feature Branch Isolation:** Created dedicated `feat/*` branches off `main` for all infrastructure modifications.
2. **Diff Audit & PR Submission:** Reviewed local diffs prior to committing, pushed branches to GitHub, and validated changes via Pull Requests.

## 4. Commands Executed & Purpose
1. `git checkout -b feat/infra-branching-update`
   - **Purpose:** Creates and switches to a new feature branch isolated from `main`.
2. `git status && git diff`
   - **Purpose:** Audits staged and unstaged infrastructure changes before committing.
3. `git push -u origin feat/infra-branching-update`
   - **Purpose:** Pushes the feature branch to GitHub to open a Pull Request for review and CI validation.

## 5. Expected Output & Verification
- Changes are merged into `main` only via Pull Requests after passing automated GitHub Actions CI checks.
