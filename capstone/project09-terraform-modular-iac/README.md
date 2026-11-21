# Project 09: Reusable Modular Infrastructure as Code with Terraform

## 1. Project Overview & Goal
Monolithic `.tf` files ke bajay reusable **Terraform Modules** (`network`, `security`, `compute`) architecture implement karna taaki ek hi infrastructure pattern ko alag-alag environments (Dev/Staging/Prod) mein DRY (Don't Repeat Yourself) principle ke saath reuse kiya ja sake.

## 2. Key Concepts Implemented
- Parent/Root module aur Child modules ke beech `input variables` aur `module outputs` ka data flow.
- Standardized formatting (`terraform fmt`) aur static validation (`terraform validate`).

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Module Separation:** Networking aur Compute logic ko reusable child modules mein encapsulate kiya.
2. **Root Composition:** Root configuration mein `module` blocks ke zariye variables pass karke dependencies link ki.
3. **Validation & Plan:** `terraform init` se local modules register karke syntax aur execution plan verify kiya.

## 4. Commands Executed & Unka Kaam
1. `terraform init`
   - **Kaam:** Root aur sabhi child Terraform modules ko initialize karke `.terraform/modules` mein link karta hai.
2. `terraform fmt -recursive && terraform validate`
   - **Kaam:** Sabhi subdirectories ki `.tf` files ko format aur validate karta hai.
3. `terraform plan`
   - **Kaam:** Modular infrastructure stack ka dry-run execution plan generate karta hai.

## 5. Expected Output / Verification
- `terraform validate` `Success! The configuration is valid.` return karta hai aur `terraform plan` sabhi modular resources cleanly list karta hai.
