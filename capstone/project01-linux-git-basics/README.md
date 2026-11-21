# Project 01: Linux Administration, Permissions & Git/GitHub Workflow

## Project Goal
Linux server administration ke core concepts (directory management, file permissions, process inspection) aur Git/GitHub version control workflow ko set up karna taaki poore DevOps Capstone ka code aur documentation securely version-controlled rahe.

## Kya & Kaise Kiya (Detailed Summary)
1. **Workspace & Directory Hierarchy Setup:** Local Linux VM par `~/Desktop/Capston` workspace banaya aur har project ke liye clean folder structure तैयार kiya.
2. **Linux File Permissions & Security:** SSH private keys (`.pem`) par strict `400` permissions aur automation scripts (`.sh`) par `700`/`755` execution permissions set kiye.
3. **Git Repository & `.gitignore` Configuration:** Local Git repository initialize karke `.gitignore` mein sensitive files (`*.pem`, `*.key`, `.env`, `.aws/`, `*.tfstate`) block kiye taaki credentials GitHub par leak na hon.
4. **Remote Sync with GitHub:** `yadavamrish/amrish_capstone` remote repository ko link karke commits push kiye.

## Commands Used & Unka Kaam (Detailed Reference)

1. `mkdir -p ~/Desktop/Capston && cd ~/Desktop/Capston`
   - **Kaam:** Parent directories ke saath Capstone ka main working folder banata hai (`-p` flag error nahi deta agar folder pehle se ho) aur us directory ke andar navigate karta hai.
2. `chmod 400 <private-key>.pem`
   - **Kaam:** File permissions ko sirf owner ke liye read-only (`r--------`) set karta hai. AWS EC2 par SSH login karte waqt yeh mandatory hota hai, warna `UNPROTECTED PRIVATE KEY FILE` error aata hai.
3. `chmod +x <script-name>.sh`
   - **Kaam:** Shell script ko executable permission deta hai taaki use `./script-name.sh` se directly run kiya ja sake.
4. `git init`
   - **Kaam:** Current directory mein ek naya local Git repository (`.git` folder) initialize karta hai.
5. `git config --global user.name "Amrish Yadav" && git config --global user.email "amrishrock2002@gmail.com"`
   - **Kaam:** Git commits ke saath author ka naam aur email attach karne ke liye global identity configure karta hai.
6. `git remote add origin https://github.com/yadavamrish/amrish_capstone.git`
   - **Kaam:** Local repository ko GitHub par maujood remote repository URL (`origin`) se link karta hai.
7. `git add .gitignore README.md capstone/`
   - **Kaam:** Modified aur newly created files ko staging area mein add karta hai taaki unhein commit kiya ja sake.
8. `git commit -m "feat: initialize capstone repository structure"`
   - **Kaam:** Staged changes ka ek permanent snapshot (commit) descriptive message ke saath local Git history mein save karta hai.
9. `git pull --rebase origin main && git push -u origin main`
   - **Kaam:** Pehle GitHub ke remote changes ko cleanly sync (`--rebase`) karta hai aur phir local commits ko GitHub ki `main` branch par upload (`push`) karta hai.
