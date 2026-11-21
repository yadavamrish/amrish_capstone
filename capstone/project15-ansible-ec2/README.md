# Project 15: Agentless Configuration Management with EC2-Based Ansible

## 1. Project Overview & Goal
The goal of this project is to establish an AWS EC2-based **Ansible Controller** and **Managed Node** architecture (`inventory.ini`) to automate web server installation (`install_webserver.yml`) and configuration (`configure-webserver.yml`) over SSH without installing agents on target hosts.

## 2. Files in This Folder
- `inventory.ini` — Defines the target managed EC2 host IP, SSH user (`ubuntu`), and private key parameters.
- `install_webserver.yml` — Declarative Ansible playbook that installs and starts the web server package on the managed EC2 node.
- `configure-webserver.yml` — Declarative Ansible playbook that configures the web server and deploys custom HTML content.

## 3. Step-by-Step Implementation
1. **Controller & Managed EC2 Provisioning:** Launched Controller and Managed Ubuntu EC2 instances in `ap-south-1` and secured the SSH private key (`chmod 400`).
2. **Inventory & Ad-Hoc Connectivity Check:** Configured `inventory.ini` and verified SSH + Python readiness using `ansible all -m ping`.
3. **Playbook Execution:** Ran `install_webserver.yml` and `configure-webserver.yml` to automatically provision the web server on the managed node.

## 4. Commands Executed & Purpose
1. `chmod 400 amrish-p15-ansible-key.pem`
   - **Purpose:** Enforces strict read-only owner permissions on the SSH private key required by OpenSSH/Ansible.
2. `ansible all -i capstone/project15-ansible-ec2/inventory.ini -m ping`
   - **Purpose:** Tests SSH connectivity and Python interpreter availability (`pong`) on all hosts in `inventory.ini`.
3. `ansible-playbook -i capstone/project15-ansible-ec2/inventory.ini capstone/project15-ansible-ec2/install_webserver.yml`
   - **Purpose:** Installs and enables the web server daemon on the managed EC2 instance.
4. `ansible-playbook -i capstone/project15-ansible-ec2/inventory.ini capstone/project15-ansible-ec2/configure-webserver.yml`
   - **Purpose:** Applies web server configuration and deploys the webpage on the managed node.

## 5. Expected Output & Verification
- Ansible reports `failed=0` with `ok` and `changed` tasks, and the managed EC2 instance serves `HTTP 200 OK` on Port 80.
