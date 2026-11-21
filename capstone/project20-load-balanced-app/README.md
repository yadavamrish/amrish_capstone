# Project 20: High-Availability Multi-AZ Load Balanced App Deployment

## 1. Project Overview & Goal
The goal of this project is to achieve high availability and horizontal traffic distribution by deploying **2 EC2 Nginx web servers** (`amrish-p20-web-1` and `amrish-p20-web-2`) across separate Availability Zones behind an **Application Load Balancer (ALB)** and a `/health`-monitored **Target Group**.

## 2. Architecture Components
- **2x EC2 Nginx Instances (`t3.micro`):** Deployed in `ap-south-1a` and `ap-south-1b` with distinct Server 1 / Server 2 HTML pages and a `/health` endpoint.
- **Target Group (`amrish-p20-web-tg`):** Performs HTTP health checks on `/health` every 10 seconds.
- **Application Load Balancer (`amrish-p20-app-alb`):** Distributes incoming Port 80 traffic across healthy EC2 targets using round-robin routing.

## 3. Step-by-Step Implementation
1. **Multi-AZ Compute Provisioning:** Launched two EC2 instances with user-data scripts configuring Nginx, `/health`, and server-specific landing pages.
2. **Target Group & ALB Configuration:** Created `amrish-p20-web-tg`, registered both EC2 instance IDs, and attached the Target Group to `amrish-p20-app-alb`.
3. **Health & Round-Robin Verification:** Verified `healthy` target states via CLI and proved alternating Server 1 / Server 2 responses over consecutive HTTP requests.

## 4. Commands Executed & Purpose
1. `aws elbv2 create-target-group --name amrish-p20-web-tg --protocol HTTP --port 80 --vpc-id $VPC_ID --health-check-path /health --health-check-interval-seconds 10 --region ap-south-1`
   - **Purpose:** Creates an ALB Target Group configured to monitor `/health` every 10 seconds.
2. `aws elbv2 register-targets --target-group-arn $TG_ARN --targets Id=$EC2_1 Id=$EC2_2 --region ap-south-1`
   - **Purpose:** Registers both EC2 web servers into the Target Group.
3. `aws elbv2 describe-target-health --target-group-arn $TG_ARN --region ap-south-1 --output table`
   - **Purpose:** Verifies that both registered EC2 targets pass health checks (`healthy`).
4. `for i in 1 2 3 4; do curl -s http://$ALB_DNS | grep -E "Server 1|Server 2"; done`
   - **Purpose:** Sends sequential requests to the ALB DNS endpoint to confirm round-robin traffic distribution between Server 1 and Server 2.

## 5. Expected Output & Verification
- `describe-target-health` shows both instances as `healthy`, and consecutive `curl` requests alternate between `Server 1` and `Server 2`.
