# Project 20: High-Availability Multi-AZ Load Balanced App Deployment

## 1. Project Overview & Goal
Application scalability aur fault tolerance badhane ke liye 2 EC2 Nginx web servers (`amrish-p20-web-1` & `amrish-p20-web-2`) ko alag-alag Availability Zones mein deploy karke unke aage ek **Application Load Balancer (ALB)** aur `/health` check wala **Target Group** configure karna.

## 2. Key Architecture Components
- **2x EC2 Web Servers (`t3.micro`):** Alag-alag subnets (`ap-south-1a` & `ap-south-1b`) mein Nginx aur `/health` endpoint ke saath.
- **Target Group (`amrish-p20-web-tg`):** Har 10 seconds mein `/health` path check karke healthy servers ko track karta hai.
- **Application Load Balancer (`amrish-p20-app-alb`):** Port 80 HTTP listener ke zariye incoming traffic ko dono servers par round-robin distribute karta hai.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Multi-AZ Compute Setup:** User-data scripts ke saath 2 EC2 instances launch kiye jismein Server 1 aur Server 2 ke distinct HTML pages aur `/health` check endpoint configure kiye.
2. **Target Group & ALB Wiring:** Target group banakar dono EC2 IDs register kiye aur ALB listener se link kiya.
3. **Health & Round-Robin Verification:** `describe-target-health` se dono targets ko `healthy` verify kiya aur multiple `curl` calls se alternating responses prove kiye.

## 4. Commands Executed & Unka Kaam
1. `aws elbv2 create-target-group --name amrish-p20-web-tg --protocol HTTP --port 80 --vpc-id $VPC_ID --health-check-path /health --health-check-interval-seconds 10 --region ap-south-1`
   - **Kaam:** ALB ke liye Target Group banata hai jo `/health` endpoint monitor karta hai.
2. `aws elbv2 register-targets --target-group-arn $TG_ARN --targets Id=$EC2_1 Id=$EC2_2 --region ap-south-1`
   - **Kaam:** Dono EC2 web servers ko Target Group mein register karta hai.
3. `aws elbv2 describe-target-health --target-group-arn $TG_ARN --region ap-south-1 --output table`
   - **Kaam:** Verify karta hai ki dono registered EC2 instances `healthy` state mein hain.
4. `for i in 1 2 3 4; do curl -s http://$ALB_DNS | grep -E "Server 1|Server 2"; done`
   - **Kaam:** ALB DNS endpoint par lagatar requests bhej kar round-robin load balancing (Server 1 aur Server 2 alternating output) verify karta hai.

## 5. Expected Output / Verification
- `describe-target-health` mein dono targets `healthy` dikhte hain aur `curl` loop mein Server 1 aur Server 2 alternate hokar respond karte hain.
