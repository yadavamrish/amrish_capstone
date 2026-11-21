# Project 16: Enforce HTTPS via AWS Certificate Manager (ACM) & ALB

## 1. Project Overview & Goal
The goal of this project is to generate an X.509 SSL/TLS certificate using OpenSSL, import it into **AWS Certificate Manager (ACM)**, and attach it to an **Application Load Balancer (ALB)** to enforce encrypted **HTTPS (Port 443)** traffic while blocking unencrypted **HTTP (Port 80)**.

## 2. Files in This Folder
- `certificate.crt` — 365-day X.509 public SSL certificate (`CN=amrish-capstone.local`) generated via OpenSSL and imported into AWS ACM.

## 3. Step-by-Step Implementation
1. **SSL/TLS Certificate Generation:** Generated a 2048-bit RSA private key and self-signed X.509 certificate (`certificate.crt`) using OpenSSL.
2. **AWS ACM Certificate Import:** Imported the certificate and private key into AWS ACM (`ap-south-1`) to obtain a `CertificateArn`.
3. **ALB Security Group & Listeners:** Created `amrish-alb-https-sg` allowing only TCP `Port 443`, provisioned `amrish-capstone-alb`, bound the ACM certificate to the HTTPS `443` listener (`200 OK`), and blocked Port `80` (`403 Forbidden`).

## 4. Commands Executed & Purpose
1. `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -subj "/C=IN/ST=Haryana/L=Gurugram/O=Accenture/OU=DevOps/CN=amrish-capstone.local"`
   - **Purpose:** Generates a 2048-bit RSA private key and 365-day X.509 SSL certificate.
2. `aws acm import-certificate --certificate fileb://capstone/project16-https-acm/certificate.crt --private-key fileb://private.key --region ap-south-1`
   - **Purpose:** Uploads the SSL certificate into AWS Certificate Manager (ACM) and returns its `CertificateArn`.
3. `aws elbv2 create-listener --load-balancer-arn $ALB_ARN --protocol HTTPS --port 443 --certificates CertificateArn=$CERT_ARN --default-actions Type=fixed-response,FixedResponseConfig='{MessageBody="HTTPS Enabled Successfully",StatusCode="200",ContentType="text/plain"}' --region ap-south-1`
   - **Purpose:** Configures an HTTPS listener on Port 443 bound to the ACM certificate.
4. `curl -k -i "https://$ALB_DNS"`
   - **Purpose:** Validates the TLS handshake and `HTTP 200 OK` response over HTTPS (`-k` bypasses self-signed trust warnings).

## 5. Expected Output & Verification
- `https://$ALB_DNS` returns `HTTP/2 200` (`HTTPS Enabled Successfully`), while unencrypted HTTP (`Port 80`) is blocked.
