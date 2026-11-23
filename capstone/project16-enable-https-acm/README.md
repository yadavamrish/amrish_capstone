# Project 16: Enable HTTPS using ACM

## Goal
Secure web application traffic over HTTPS using AWS Certificate Manager (ACM) and an Application Load Balancer (ALB), while blocking/redirecting unencrypted HTTP.

## Steps Performed
1. Requested/imported an SSL/TLS certificate in AWS Certificate Manager (ACM).
2. Configured an Application Load Balancer (ALB) with an **HTTPS (Port 443)** listener attached to the ACM certificate and forwarding traffic to the EC2 Target Group.
3. Configured the **HTTP (Port 80)** listener to redirect (`301`) to HTTPS (or blocked plain HTTP access).
4. Verified the padlock icon and secure `https://` connection in the browser.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `aws acm list-certificates` | Verifies the ACM SSL/TLS certificate status (`ISSUED`). |
| `curl -I https://<CUSTOM-DOMAIN>` | Verifies TLS handshake and `HTTP/2 200` response over HTTPS. |
| `curl -I http://<CUSTOM-DOMAIN>` | Confirms HTTP (port 80) is blocked or redirected to HTTPS (`301 Moved Permanently`). |

## Deliverables
- Screenshot showing secure `https://` lock icon in browser (`screenshots/`)
