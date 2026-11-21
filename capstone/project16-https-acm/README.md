# Project 16: Enable HTTPS using AWS Certificate Manager (ACM) & ALB

## Project Goal
AWS Certificate Manager (ACM) aur Application Load Balancer (ALB) ke through HTTPS traffic (Port 443) enforce karna aur unencrypted HTTP traffic (Port 80) ko block karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **SSL/TLS Certificate Generation:** OpenSSL ke through 2048-bit RSA private key (`private.key`) aur 365-day X.509 certificate (`certificate.crt`) generate kiya.
2. **Imported Certificate into AWS ACM:** Local certificate aur private key ko AWS Mumbai (`ap-south-1`) ke ACM service mein import karke `CertificateArn` fetch kiya.
3. **ALB Security Group & Listeners Configuration:** `amrish-alb-https-sg` banaya jismein sirf TCP Port 443 open rakha, `amrish-capstone-alb` provision kiya, Port 443 HTTPS listener par ACM certificate attach karke `200 OK` response serve kiya, aur Port 80 HTTP listener par `403 Forbidden` lagaya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out certificate.crt -subj "/C=IN/ST=Haryana/L=Gurugram/O=Accenture/OU=DevOps/CN=amrish-capstone.local"`
   - **Kaam:** 365 din ki validity wala 2048-bit RSA self-signed SSL certificate (`certificate.crt`) aur private key (`private.key`) generate karta hai.
2. `aws acm import-certificate --certificate fileb://certificate.crt --private-key fileb://private.key --region ap-south-1`
   - **Kaam:** Local SSL certificate aur private key ko AWS Certificate Manager (ACM) mein upload karke `CertificateArn` return karta hai.
3. `aws ec2 authorize-security-group-ingress --group-id $SG_ID --protocol tcp --port 443 --cidr 0.0.0.0/0 --region ap-south-1`
   - **Kaam:** ALB Security Group mein sirf encrypted HTTPS (Port 443) incoming traffic allow karta hai aur Port 80 ko network level par block rakhta hai.
4. `aws elbv2 create-load-balancer --name amrish-capstone-alb --subnets $SUBNET_1 $SUBNET_2 --security-groups $SG_ID --scheme internet-facing --type application --region ap-south-1`
   - **Kaam:** Multiple subnets mein internet-facing Application Load Balancer (ALB) provision karta hai.
5. `aws elbv2 create-listener --load-balancer-arn $ALB_ARN --protocol HTTPS --port 443 --certificates CertificateArn=$CERT_ARN --default-actions Type=fixed-response,FixedResponseConfig='{MessageBody="HTTPS Enabled Successfully",StatusCode="200",ContentType="text/plain"}' --region ap-south-1`
   - **Kaam:** ALB par Port 443 HTTPS listener banakar ACM SSL certificate bind karta hai aur `200 OK` response serve karta hai.
6. `curl -k -i "https://$ALB_DNS"`
   - **Kaam:** Self-signed SSL warning bypass (`-k`) karke HTTPS endpoint ke TLS headers aur `200 OK` response ko verify karta hai.
