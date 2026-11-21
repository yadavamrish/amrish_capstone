# Project 21: CloudWatch Monitoring Dashboard

## Project Goal
`dashboard-body.json` configuration ke through Amazon CloudWatch Dashboard (`amrish-capstone-performance-dashboard`) create karke EC2 CPU/Network, ALB Requests/Latency, aur CloudWatch Logs metrics ko ek single pane par visualize karna.

## Kya & Kaise Kiya
1. **Dashboard JSON Definition (`dashboard-body.json`):** 4-widget layout (EC2 CPU & Network I/O, ALB RequestCount & TargetResponseTime, CloudWatch Logs IncomingBytes/Events, aur Markdown summary card) define kiya.
2. **CLI Deployment & Verification:** `aws cloudwatch put-dashboard` run karke `ap-south-1` mein dashboard deploy kiya aur CloudWatch Console mein graphs verify kiye.

## Commands Used & Unka Kaam
1. `aws cloudwatch put-dashboard --dashboard-name amrish-capstone-performance-dashboard --dashboard-body file://capstone/project21-cloudwatch-monitoring-dashboard/dashboard-body.json --region ap-south-1`
   - **Kaam:** `dashboard-body.json` se AWS CloudWatch mein performance monitoring dashboard create/update karta hai.
2. `aws cloudwatch list-dashboards --region ap-south-1 --output table`
   - **Kaam:** Deployed CloudWatch Dashboard ka naam aur ARN CLI se verify karta hai.
