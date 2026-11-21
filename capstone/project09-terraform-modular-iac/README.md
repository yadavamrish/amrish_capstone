# Project 09: Reusable Modular Infrastructure as Code with Terraform

## 1. Project Overview & Goal
The goal of this project is to refactor monolithic Terraform configurations into reusable **Child Modules** (`network`, `security`, `compute`) following the DRY (Don't Repeat Yourself) principle for scalable multi-environment deployments.

## 2. Key Concepts Implemented
- Module encapsulation using `variables.tf` (inputs) and `outputs.tf` (exported attributes).
- Standardized recursive formatting (`terraform fmt`) and static validation (`terraform validate`).

## 3. Step-by-Step Implementation
1. **Module Decomposition:** Separated networking, security groups, and compute resources into reusable child modules.
2. **Root Module Composition:** Wired child modules together in the root configuration by passing outputs from one module as inputs to another.
3. **Initialization & Plan Check:** Registered local modules via `terraform init` and validated syntax and execution plans.

## 4. Commands Executed & Purpose
1. `terraform init`
   - **Purpose:** Initializes root and child Terraform modules and links them inside `.terraform/modules`.
2. `terraform fmt -recursive && terraform validate`
   - **Purpose:** Formats all `.tf` files across subdirectories and validates module configurations.
3. `terraform plan`
   - **Purpose:** Generates a unified execution plan across all composed Terraform modules.

## 5. Expected Output & Verification
- `terraform validate` outputs `Success! The configuration is valid.` and `terraform plan` cleanly resolves all cross-module dependencies.
