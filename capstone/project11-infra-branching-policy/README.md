# Project 11: Infra Branching Policy

## Project Goal
Infrastructure-as-Code repository ke liye Git branching strategy (`main`, `develop`, `feat/*`, `fix/*`) aur Pull Request review rules enforce karna taaki direct unreviewed changes `main` branch par na jayein.

## Kya & Kaise Kiya
1. **Feature Branch Workflow:** Direct `main` commits ke bajay feature branches par changes develop karke PR ke through merge karne ka standard establish kiya.
2. **CI Gate Integration:** PR raise hone par automated validation checks run karne ka workflow link kiya.

## Commands Used & Unka Kaam
1. `git checkout -b feat/infra-update`
   - **Kaam:** `main` branch se ek isolated feature branch create karta hai.
2. `git status && git diff`
   - **Kaam:** Branch par kiye gaye infrastructure changes ko commit se pehle review karta hai.
3. `git push -u origin feat/infra-update`
   - **Kaam:** Feature branch ko GitHub par push karta hai taaki Pull Request create ki ja sake.
