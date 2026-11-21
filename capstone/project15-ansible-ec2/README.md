# Project 15: EC2-Based Ansible

## Project Goal
AWS EC2-based Ansible Controller aur Managed Node setup (`inventory.ini`) se agentless playbooks (`install_webserver.yml`, `configure-webserver.yml`) run karke web server provisioning automate karna.

## Kya & Kaise Kiya
1. **Inventory Configuration (`inventory.ini`):** Managed EC2 instance ke IP address, SSH user (`ubuntu`), aur private key path ko `inventory.ini` mein define kiya.
2. **Ansible Playbooks (`install_webserver.yml` & `configure-webserver.yml`):** Managed EC2 node par web server package install aur configure karne ke declarative YAML playbooks likhe.
3. **Connectivity & Playbook Execution:** `ansible all -m ping` se SSH + Python connectivity verify ki aur `ansible-playbook` run karke web server live kiya.

## Commands Used & Unka Kaam
1. `chmod 400 amrish-p15-ansible-key.pem`
   - **Kaam:** SSH private key par secure read-only permission set karta hai.
2. `ansible all -i capstone/project15-ansible-ec2/inventory.ini -m ping`
   - **Kaam:** `inventory.ini` mein listed managed EC2 node par SSH connectivity test (`pong`) karta hai.
3. `ansible-playbook -i capstone/project15-ansible-ec2/inventory.ini capstone/project15-ansible-ec2/install_webserver.yml`
   - **Kaam:** Managed EC2 node par web server package install aur start karta hai.
4. `ansible-playbook -i capstone/project15-ansible-ec2/inventory.ini capstone/project15-ansible-ec2/configure-webserver.yml`
   - **Kaam:** Web server configuration aur custom HTML deployment execute karta hai.
