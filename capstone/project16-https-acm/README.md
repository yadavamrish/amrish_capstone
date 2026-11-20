# Project 16: Enable HTTPS using ACM

## Steps Performed

1. **ACM SSL/TLS Certificate Setup:**
   - Generated an X.509 certificate and imported it into AWS Certificate Manager (`aws acm import-certificate` in `ap-south-1`).

2. **ALB HTTPS Listener & HTTP Blocking:**
   - Provisioned an internet-facing Application Load Balancer (`amrish-capstone-alb`) with Security Group allowing port `443` (HTTPS) and blocking port `80` (HTTP).
   - Configured an `HTTPS:443` listener attached to the ACM certificate and an `HTTP:80` listener returning `403 Forbidden` to block unencrypted HTTP traffic.
   - Verified live HTTPS access via `https://<ALB_DNS>` and captured the HTTPS deliverable screenshot.
