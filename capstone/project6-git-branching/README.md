# Project 6: Git Branching & Pull Request Workflow

## Maine Kya-Kya Kiya (Steps Performed)

1. **Repository Setup Aur Branch Creation:**
   - GitHub repository (`amrish_capstone`) ko local Linux VM par clone/configure kiya.
   - `main` branch se ek naya feature branch (`feature-update`) create karke checkout kiya:
     ```bash
     git checkout -b feature-update
     ```

2. **Changes Commit Aur Push Kiye:**
   - Feature branch mein project files update karke changes ko stage aur commit kiya:
     ```bash
     git add .
     git commit -m "feat: add updates on feature branch"
     git push -u origin feature-update
     ```

3. **Pull Request (PR) & Merge To `main`:**
   - GitHub par `feature-update` se `main` branch ke liye **Pull Request (PR)** raise ki.
   - Changes review karne ke baad PR ko `main` branch mein merge kiya aur local repository ko `git pull origin main` se sync kiya.
