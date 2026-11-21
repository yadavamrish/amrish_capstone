# Project 21: CloudWatch Monitoring Dashboard

## Project Goal
Infrastructure aur application ke real-time performance metrics (EC2 CPU/Network, ALB Requests/Latency, aur CloudWatch Logs ingestion) ko ek single Amazon CloudWatch Dashboard par visualize karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Metrics Widgets Configuration (`dashboard-body.json`):** 4-widget JSON layout design kiya jismein EC2 (`CPUUtilization`, `NetworkIn`, `NetworkOut`), Application Load Balancer (`RequestCount`, `TargetResponseTime`), aur CloudWatch Logs (`IncomingBytes`, `IncomingLogEvents`) time-series graphs aur Markdown summary card add kiye.
2. **Dashboard Provisioning via CLI:** `aws cloudwatch put-dashboard` ke through AWS Mumbai (`ap-south-1`) mein `amrish-capstone-performance-dashboard` create kiya.
3. **Visualization Verification:** AWS CloudWatch Console mein dashboard open karke live telemetry graphs verify kiye.

## Commands Used & Unka Kaam (Detailed Reference)

1. `aws cloudwatch put-dashboard --dashboard-name amrish-capstone-performance-dashboard --dashboard-body file://capstone/project21-cloudwatch-dashboard/dashboard-body.json --region ap-south-1`
   - **Kaam:** JSON widget configuration se AWS CloudWatch mein custom performance monitoring dashboard create ya update karta hai.
2. `aws cloudwatch list-dashboards --region ap-south-1 --output table`
   - **Kaam:** AWS account mein maujood sabhi CloudWatch dashboards aur unke ARNs ki list dikhata hai.
3. `aws cloudwatch get-dashboard --dashboard-name amrish-capstone-performance-dashboard --region ap-south-1`
   - **Kaam:** Deployed dashboard ka saved widget JSON structure verify karne ke liye fetch karta hai.
