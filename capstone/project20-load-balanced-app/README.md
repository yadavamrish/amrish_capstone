# Project 20: Load Balanced App Deployment

## Goal
Improve application scale and performance by distributing incoming traffic across two EC2 instances behind an Application Load Balancer (ALB).

## Steps Performed
1. **Deployed 2 Backend EC2 Instances:** Provisioned `amrish-p20-web-1` and `amrish-p20-web-2` across two Availability Zones in `ap-south-1` running Nginx with a `/health` check endpoint.
2. **Configured ALB & Health Checks:** Created `amrish-p20-app-alb` and Target Group `amrish-p20-web-tg` with HTTP health checks on `/health` (10s interval, healthy threshold 2).
3. **Verified Load Balancing:** Confirmed both targets reached `healthy` state and verified round-robin traffic distribution between Server 1 and Server 2.
