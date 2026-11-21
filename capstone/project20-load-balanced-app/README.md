# Project 20: Load Balanced App Deployment

## Project Goal
Application scalability, performance, aur high availability badhane ke liye 2 EC2 web servers ko alag-alag Availability Zones mein deploy karke unke aage ek Application Load Balancer (ALB) configure karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Multi-AZ EC2 Web Servers Deployment:** 2 subnets (`ap-south-1a` & `ap-south-1b`) mein 2 Ubuntu EC2 instances (`amrish-p20-web-1` & `amrish-p20-web-2`) launch kiye aur `--user-data` bootstrap scripts se Nginx, `/health` endpoint, aur distinct Server 1 / Server 2 HTML pages configure kiye.
2. **Target Group & Health Checks:** `amrish-p20-web-tg` Target Group banaya jo har 10 seconds mein `/health` path check karta hai, aur dono EC2 instances ko register kiya.
3. **ALB Provisioning & Round-Robin Verification:** `amrish-p20-app-alb` ko Port 80 HTTP listener ke saath Target Group se joda, dono targets ko `healthy` verify kiya, aur multiple `curl` requests se alternating traffic distribution test kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `aws ec2 run-instances --image-id $AMI_ID --instance-type t3.micro --subnet-id $SUBNET_1 --security-group-ids $SG_ID --user-data file:///tmp/p20_server1.sh --region ap-south-1`
   - **Kaam:** First Availability Zone mein EC2 instance launch karta hai aur `--user-data` script se boot time par automatically Nginx aur `/health` endpoint setup karta hai.
2. `aws elbv2 create-target-group --name amrish-p20-web-tg --protocol HTTP --port 80 --vpc-id $VPC_ID --health-check-path /health --health-check-interval-seconds 10 --healthy-threshold-count 2 --region ap-south-1`
   - **Kaam:** ALB ke liye Target Group banata hai jo har 10 seconds mein `/health` check karke healthy EC2 servers ko track karta hai.
3. `aws elbv2 register-targets --target-group-arn $TG_ARN --targets Id=$EC2_1 Id=$EC2_2 --region ap-south-1`
   - **Kaam:** Dono EC2 web servers ko Load Balancer ke Target Group mein register karta hai.
4. `aws elbv2 describe-target-health --target-group-arn $TG_ARN --region ap-south-1 --output table`
   - **Kaam:** Verify karta hai ki dono registered EC2 instances health checks pass karke `healthy` state mein aa gaye hain.
5. `for i in 1 2 3 4; do curl -s http://$ALB_DNS | grep -E "Server 1|Server 2"; done`
   - **Kaam:** ALB DNS endpoint par lagatar requests bhej kar round-robin load balancing (alternating Server 1 aur Server 2 responses) prove karta hai.
