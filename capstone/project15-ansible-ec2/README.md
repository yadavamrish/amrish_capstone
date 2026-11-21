# Project 15: EC2-Based Ansible Controller & Managed Node Setup

## Project Goal
Local machine SSH dependency hatakar AWS EC2-based Ansible Controller aur Managed Node architecture set up karna taaki multiple Linux servers par agentless configuration management automate ho sake.

## Kya & Kaise Kiya (Detailed Summary)
1. **Provisioned Controller & Managed EC2 Nodes:** AWS Mumbai (`ap-south-1`) mein 2 Ubuntu EC2 instances (`amrish-ansible-controller` aur `amrish-ansible-managed`) launch kiye jismein SSH (Port 22) aur HTTP (Port 80) allowed hain.
2. **Configured Controller Node:** Controller instance par Ansible install kiya, `.pem` SSH private key transfer karke `chmod 400` set kiya, aur `inventory.ini` mein Managed Node IP define ki.
3. **Executed Ad-Hoc Ping & Playbook:** `ansible all -m ping` se SSH + Python connectivity verify ki aur YAML playbook (`site.yml`) run karke Managed Node par automatically Nginx web server deploy kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `aws ec2 run-instances --image-id $AMI_ID --instance-type t3.micro --count 2 --key-name amrish-ansible-key --security-group-ids $SG_ID --region ap-south-1`
   - **Kaam:** Ansible Controller aur Managed Node ke liye ek saath 2 Ubuntu EC2 instances launch karta hai.
2. `scp -i amrish-ansible-key.pem amrish-ansible-key.pem ubuntu@$CONTROLLER_IP:~/`
   - **Kaam:** Local VM se `.pem` SSH private key ko securely Ansible Controller EC2 instance par copy karta hai.
3. `sudo apt update && sudo apt install -y ansible`
   - **Kaam:** Controller EC2 instance par Ansible automation engine install karta hai.
4. `chmod 400 ~/amrish-ansible-key.pem`
   - **Kaam:** Private key par strict read-only permission set karta hai taaki Ansible SSH connection reject na ho.
5. `ansible all -i inventory.ini -m ping`
   - **Kaam:** `inventory.ini` mein listed sabhi managed EC2 hosts par SSH login aur Python interpreter availability test (`pong`) karta hai.
6. `ansible-playbook -i inventory.ini site.yml`
   - **Kaam:** Declarative YAML playbook execute karke managed EC2 node par Nginx install, start, aur custom webpage configure karta hai.
