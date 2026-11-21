# Project 11: Infrastructure Git Branching & Pull Request Policy

## 1. Project Overview & Goal
Production infrastructure repository (`amrish_capstone`) ko accidental changes se bachane ke liye structured **Git Branching Strategy** (`main`, `feat/*`, `fix/*`) aur Pull Request (PR) review workflow enforce karna.

## 2. Key Concepts Implemented
- Branch isolation (`main` protected production branch vs feature branches).
- Pre-merge CI validation checks aur clean commit history conventions.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Feature Branch Workflow:** Direct `main` par push karne ke bajay `feat/*` branch create karke infrastructure changes develop kiye.
2. **Diff Audit & PR Submission:** Commit se pehle `git diff` se changes audit kiye aur Pull Request ke through review aur automated CI checks trigger kiye.

## 4. Commands Executed & Unka Kaam
1. `git checkout -b feat/infra-branching-update`
   - **Kaam:** `main` branch se ek isolated feature branch create karta hai.
2. `git status && git diff`
   - **Kaam:** Modified infrastructure files ko commit se pehle review karta hai.
3. `git push -u origin feat/infra-branching-update`
   - **Kaam:** Feature branch ko GitHub par push karta hai taaki Pull Request raise ki ja sake.

## 5. Expected Output / Verification
- GitHub Pull Request par automated CI status checks pass hone ke baad hi changes `main` branch mein merge hote hain.
