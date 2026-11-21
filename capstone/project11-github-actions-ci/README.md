# Project 11: GitHub Actions CI Workflow

## Project Goal
GitHub repository par har code push ya pull request ke saath cloud-native Continuous Integration (CI) checks (linting, unit testing, aur Docker build validation) ko automatically execute karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Workflow Directory & YAML Setup:** Repository ke `.github/workflows/ci.yml` mein `push` aur `pull_request` triggers (`main` branch) configure kiye.
2. **Automated Runner Jobs:** Ubuntu GitHub-hosted runner par repository checkout (`actions/checkout`), syntax/lint checks, aur container image build verification steps add kiye.
3. **Pipeline Execution Verification:** Code commit push karke GitHub Actions tab mein green checkmark (`Succeeded`) aur job execution logs verify kiye.

## Commands Used & Unka Kaam (Detailed Reference)

1. `mkdir -p .github/workflows`
   - **Kaam:** GitHub Actions ke YAML workflow definitions store karne ke liye standard `.github/workflows` directory create karta hai.
2. `git add .github/workflows/ci.yml && git commit -m "ci: add GitHub Actions workflow"`
   - **Kaam:** CI workflow file ko Git staging area mein add karke local repository history mein commit karta hai.
3. `git push origin main`
   - **Kaam:** Workflow file ko GitHub `main` branch par push karta hai, jisse automatically cloud runner par CI workflow trigger ho jata hai.
