# Project 16: Enable HTTPS using ACM

## Project Goal
OpenSSL se SSL/TLS certificate (`certificate.crt`) generate karke AWS Certificate Manager (ACM) mein import karna aur Application Load Balancer (ALB) par HTTPS (Port 443) enforce karke HTTP (Port 80) block karna.

## Kya & Kaise Kiya
1. **SSL Certificate Generation (`certificate.crt` & `private.key`):** OpenSSL se 2048-bit RSA self-signed X.509 certificate generate kiya.
2. **AWS ACM Import & ALB Setup:** Certificate ko ACM (`ap-south-1`) mein import kiya, `amrish-alb-https-sg` (only Port 443 open) banaya, aur `amrish-capstone-alb` par HTTPS:443 listener (`200 OK`) aur HTTP:80 block (`403 Forbidden`) configure kiya.

## Commands Used & Unka Kaam
1. `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -subj "/C=IN/ST=Haryana/L=Gurugram/O=Accenture/OU=DevOps/CN=amrish-capstone.local"`
   - **Kaam:** 365 din valid 2048-bit RSA self-signed SSL certificate (`certificate.crt`) aur private key generate karta hai.
2. `aws acm import-certificate --certificate fileb://capstone/project16-https-acm/certificate.crt --private-key fileb://private.key --region ap-south-1`
   - **Kaam:** Local SSL certificate ko AWS Certificate Manager (ACM) mein import karke `CertificateArn` return karta hai.
3. `aws elbv2 create-listener --load-balancer-arn $ALB_ARN --protocol HTTPS --port 443 --certificates CertificateArn=$CERT_ARN --default-actions Type=fixed-response,FixedResponseConfig='{MessageBody="HTTPS Enabled Successfully",StatusCode="200",ContentType="text/plain"}' --region ap-south-1`
   - **Kaam:** ALB ke Port 443 par ACM SSL certificate attach karke secure HTTPS response enable karta hai.
4. `curl -k -i "https://$ALB_DNS"`
   - **Kaam:** Self-signed SSL warning bypass (`-k`) karke HTTPS endpoint ke TLS headers aur `200 OK` response verify karta hai.
