# Project 20: Load Balanced App Deployment

## Goal
Improve application availability and traffic distribution by deploying two EC2 web servers behind an Application Load Balancer (ALB) with health checks.

## Steps Performed
1. Deployed two EC2 instances (`Web-Server-1` and `Web-Server-2`) serving distinct instance identifiers.
2. Created an ALB Target Group with HTTP health checks configured on `/` (`200 OK`).
3. Registered both EC2 instances in the Target Group and attached it to an internet-facing ALB.
4. Verified `Healthy` target status and refreshed the ALB DNS URL to confirm traffic distribution across both servers.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `aws elbv2 describe-target-health --target-group-arn <TG_ARN>` | Checks that both EC2 instances report `State: healthy` in the Target Group. |
| `for i in {1..6}; do curl -s http://<ALB-DNS-NAME>; done` | Sends multiple requests to the ALB DNS to verify round-robin load balancing between both EC2s. |

## Deliverables
- Screenshot of healthy Target Group and load-balanced responses (`screenshots/`)
