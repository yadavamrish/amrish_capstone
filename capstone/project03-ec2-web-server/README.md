# Project 03: EC2 Web Server Provisioning

## Project Goal
AWS Mumbai (`ap-south-1`) region mein ek Ubuntu EC2 virtual server launch karna, Security Group firewall rules configure karna (SSH Port 22 & HTTP Port 80), aur us par Nginx web server install karke ek live webpage host karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **SSH Key Pair & Security Group Creation:** EC2 login ke liye `.pem` key pair banaya aur Security Group mein SSH (Port 22) aur HTTP (Port 80) inbound traffic allow kiya.
2. **Ubuntu AMI Lookup & EC2 Launch:** Latest Ubuntu Server 22.04 LTS AMI ID fetch karke `t3.micro` EC2 instance launch kiya aur running state ka wait kiya.
3. **Web Server Deployment (Nginx):** Public IP par SSH se connect hokar Nginx web server install kiya aur custom HTML landing page serve karke browser/CLI se verify kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `aws ec2 create-key-pair --key-name amrish-p03-key --region ap-south-1 --query 'KeyMaterial' --output text > amrish-p03-key.pem && chmod 400 amrish-p03-key.pem`
   - **Kaam:** AWS par ek naya EC2 SSH Key Pair banata hai, private key ko `.pem` file mein save karta hai, aur `chmod 400` se read-only secure permission set karta hai.
2. `aws ec2 create-security-group --group-name amrish-p03-web-sg --description "Allow SSH and HTTP" --region ap-south-1`
   - **Kaam:** EC2 instance ke firewall ke roop mein kaam karne ke liye ek naya Security Group create karta hai.
3. `aws ec2 authorize-security-group-ingress --group-id $SG_ID --protocol tcp --port 22 --cidr 0.0.0.0/0 && aws ec2 authorize-security-group-ingress --group-id $SG_ID --protocol tcp --port 80 --cidr 0.0.0.0/0`
   - **Kaam:** Security Group mein SSH (Port 22) aur HTTP web traffic (Port 80) ke liye inbound rules allow karta hai.
4. `aws ec2 describe-images --owners 099720109477 --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" "Name=state,Values=available" --region ap-south-1 --query 'sort_by(Images, &CreationDate)[-1].ImageId' --output text`
   - **Kaam:** Canonical (`099720109477`) ke official Ubuntu 22.04 LTS ki sabse latest AMI ID dynamically fetch karta hai.
5. `aws ec2 run-instances --image-id $AMI_ID --instance-type t3.micro --key-name amrish-p03-key --security-group-ids $SG_ID --region ap-south-1`
   - **Kaam:** Specified AMI, `t3.micro` instance type, key pair, aur security group ke saath AWS par naya EC2 server launch karta hai.
6. `aws ec2 describe-instances --instance-ids $EC2_ID --region ap-south-1 --query 'Reservations[0].Instances[0].PublicIpAddress' --output text`
   - **Kaam:** Launch hue EC2 instance ka assigned Public IPv4 address print karta hai.
7. `ssh -i amrish-p03-key.pem ubuntu@$PUBLIC_IP`
   - **Kaam:** Private key ke through EC2 Ubuntu server ke andar secure SSH terminal session open karta hai.
8. `sudo apt update && sudo apt install -y nginx && sudo systemctl enable --now nginx`
   - **Kaam:** EC2 server par package index update karke Nginx web server install karta hai aur boot par auto-start enable karta hai.
9. `curl -i http://$PUBLIC_IP`
   - **Kaam:** Deployed web server ke Public IP par HTTP request bhej kar `200 OK` status aur HTML response verify karta hai.
