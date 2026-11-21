# Project 20: Load Balanced App Deployment

## Project Goal
High availability aur horizontal scalability ke liye 2 EC2 Nginx web servers (`amrish-p20-web-1` & `amrish-p20-web-2`) ko alag-alag Availability Zones mein deploy karke Application Load Balancer (`amrish-p20-app-alb`) aur Target Group (`/health` check) ke peeche load balance karna.

## Kya & Kaise Kiya
1. **2 Multi-AZ EC2 Web Servers:** Boot-time user-data scripts se dono EC2 instances par Nginx, `/health` endpoint, aur distinct Server 1 / Server 2 HTML pages deploy kiye.
2. **Target Group & ALB Round-Robin:** `amrish-p20-web-tg` mein `/health` check configure karke dono targets ko `healthy` verify kiya aur ALB DNS par alternating traffic distribution test kiya.

## Commands Used & Unka Kaam
1. `aws elbv2 create-target-group --name amrish-p20-web-tg --protocol HTTP --port 80 --vpc-id $VPC_ID --health-check-path /health --health-check-interval-seconds 10 --region ap-south-1`
   - **Kaam:** ALB ke liye Target Group banata hai jo har 10s mein `/health` endpoint check karta hai.
2. `aws elbv2 register-targets --target-group-arn $TG_ARN --targets Id=$EC2_1 Id=$EC2_2 --region ap-south-1`
   - **Kaam:** Dono EC2 web servers ko Target Group mein register karta hai.
3. `aws elbv2 describe-target-health --target-group-arn $TG_ARN --region ap-south-1 --output table`
   - **Kaam:** Verify karta hai ki dono EC2 instances `healthy` state mein hain.
4. `for i in 1 2 3 4; do curl -s http://$ALB_DNS | grep -E "Server 1|Server 2"; done`
   - **Kaam:** ALB URL par requests bhej kar round-robin load balancing (Server 1 aur Server 2 alternating responses) verify karta hai.
