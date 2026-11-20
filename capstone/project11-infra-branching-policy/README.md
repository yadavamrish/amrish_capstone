# Project 11: Infra Changes with Branching Policy

## Maine Kya-Kya Kiya (Steps Performed)

1. **Feature Branch Create Kiya:**
   - Direct `main` branch par changes karne ke bajay ek dedicated feature branch (`feature/infra-branching-policy`) create kiya:
     ```bash
     git checkout -b feature/infra-branching-policy
     ```

2. **Infrastructure Documentation / Changes Push Kiye:**
   - Project 11 ke infrastructure configuration aur branching workflow documentation ko commit karke remote feature branch par push kiya:
     ```bash
     git add capstone/project11-infra-branching-policy/README.md
     git commit -m "feat(infra): add Project 11 branching policy setup"
     git push -u origin feature/infra-branching-policy
     ```

3. **Pull Request (PR) Review & Merge:**
   - GitHub par `feature/infra-branching-policy` se `main` branch ke liye Pull Request open ki.
   - Changes review karne ke baad PR ko `main` branch mein merge kiya aur PR screenshots capture kiye.
