# Project 15: Agentless Configuration Management with EC2-Based Ansible

## 1. Project Overview & Goal
AWS EC2 par **Ansible Controller** aur **Managed Node** architecture set up karke agentless SSH automation ke zariye remote Linux server par web server install aur configure karna.

## 2. Files in This Folder
- `inventory.ini` — Managed EC2 node ka public/private IP address, SSH user (`ubuntu`), aur private key path define karta hai.
- `install_webserver.yml` — Managed EC2 node par web server package install aur service enable karne wala Ansible playbook.
- `configure-webserver.yml` — Web server configuration aur custom webpage deploy karne wala Ansible playbook.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Controller & Managed EC2 Setup:** AWS `ap-south-1` mein Controller aur Managed EC2 nodes launch kiye aur SSH key permissions (`chmod 400`) configure kiye.
2. **Inventory & Ad-Hoc Ping Test:** `inventory.ini` mein target host configure karke `ansible all -m ping` se SSH + Python connectivity verify ki.
3. **Playbook Execution:** `install_webserver.yml` aur `configure-webserver.yml` run karke remote EC2 par live web server deploy kiya.

## 4. Commands Executed & Unka Kaam
1. `chmod 400 amrish-p15-ansible-key.pem`
   - **Kaam:** SSH private key par secure read-only permission set karta hai.
2. `ansible all -i capstone/project15-ansible-ec2/inventory.ini -m ping`
   - **Kaam:** `inventory.ini` mein listed managed EC2 node par SSH login aur Python availability test (`pong`) karta hai.
3. `ansible-playbook -i capstone/project15-ansible-ec2/inventory.ini capstone/project15-ansible-ec2/install_webserver.yml`
   - **Kaam:** Managed EC2 node par web server package install aur start karta hai.
4. `ansible-playbook -i capstone/project15-ansible-ec2/inventory.ini capstone/project15-ansible-ec2/configure-webserver.yml`
   - **Kaam:** Remote server par web server configuration aur webpage deploy karta hai.

## 5. Expected Output / Verification
- Playbook execution mein `failed=0` ke saath `changed` / `ok` status milta hai aur managed EC2 ke Public IP par web server `200 OK` serve karta hai.
