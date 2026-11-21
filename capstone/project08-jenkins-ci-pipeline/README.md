# Project 08: Automated CI Pipeline (Jenkins)

## Project Goal
Har code commit par automated code checkout, dependency verification, aur build checks execute karne ke liye ek self-hosted Continuous Integration (CI) pipeline configure karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Jenkins Server Setup:** Linux host par Java aur Jenkins install karke systemd service enable ki aur initial admin setup complete kiya.
2. **Declarative Pipeline (`Jenkinsfile`):** Git repository se linked declarative `Jenkinsfile` banayi jismein `Checkout`, `Build & Lint`, aur `Test` stages define kiye.
3. **Automated Execution & Verification:** Pipeline trigger karke stage view aur console build logs mein `SUCCESS` status verify kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `sudo apt update && sudo apt install -y fontconfig openjdk-17-jre`
   - **Kaam:** Jenkins server run karne ke liye required OpenJDK 17 Java runtime install karta hai.
2. `sudo systemctl enable --now jenkins`
   - **Kaam:** Jenkins daemon service ko turant start karta hai aur system reboot par auto-start enable karta hai.
3. `sudo systemctl status jenkins`
   - **Kaam:** Verify karta hai ki Jenkins service `active (running)` state mein hai.
4. `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`
   - **Kaam:** Browser mein Jenkins web UI (`http://<IP>:8080`) ko pehli baar unlock karne ke liye auto-generated admin password print karta hai.
