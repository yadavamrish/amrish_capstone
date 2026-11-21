# Project 16: Enforce HTTPS via AWS Certificate Manager (ACM) & ALB

## 1. Project Overview & Goal
OpenSSL se X.509 SSL/TLS certificate generate karke **AWS Certificate Manager (ACM)** mein import karna, aur **Application Load Balancer (ALB)** par **HTTPS (Port 443)** enforce karke unencrypted **HTTP (Port 80)** traffic block karna.

## 2. Files in This Folder
- `certificate.crt` — OpenSSL se generate kiya gaya 365-day X.509 public SSL certificate (`CN=amrish-capstone.local`) jo ACM mein import hua hai.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **SSL Certificate Generation:** OpenSSL se 2048-bit RSA private key aur `certificate.crt` generate kiya.
2. **ACM Certificate Import:** Certificate aur private key ko AWS Mumbai (`ap-south-1`) ACM mein import karke `CertificateArn` fetch kiya.
3. **ALB Security Group & Listeners:** `amrish-alb-https-sg` mein sirf TCP Port `443` open rakha, `amrish-capstone-alb` create kiya, Port `443` HTTPS listener par ACM cert attach karke `200 OK` serve kiya, aur Port `80` ko `403 Forbidden` par block kiya.

## 4. Commands Executed & Unka Kaam
1. `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -subj "/C=IN/ST=Haryana/L=Gurugram/O=Accenture/OU=DevOps/CN=amrish-capstone.local"`
   - **Kaam:** 365 din ki validity wala 2048-bit RSA SSL certificate aur private key generate karta hai.
2. `aws acm import-certificate --certificate fileb://capstone/project16-https-acm/certificate.crt --private-key fileb://private.key --region ap-south-1`
   - **Kaam:** Local SSL certificate ko AWS Certificate Manager (ACM) mein import karke `CertificateArn` return karta hai.
3. `aws elbv2 create-listener --load-balancer-arn $ALB_ARN --protocol HTTPS --port 443 --certificates CertificateArn=$CERT_ARN --default-actions Type=fixed-response,FixedResponseConfig='{MessageBody="HTTPS Enabled Successfully",StatusCode="200",ContentType="text/plain"}' --region ap-south-1`
   - **Kaam:** ALB ke Port 443 par ACM SSL certificate attach karke encrypted HTTPS response enable karta hai.
4. `curl -k -i "https://$ALB_DNS"`
   - **Kaam:** Self-signed certificate warning bypass (`-k`) karke HTTPS endpoint ke TLS headers aur `200 OK` response verify karta hai.

## 5. Expected Output / Verification
- `https://$ALB_DNS` par `HTTP/2 200` (`HTTPS Enabled Successfully`) response milta hai, jabki `http://$ALB_DNS` (Port 80) blocked rehta hai.
