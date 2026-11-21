# Project 21: Centralized AWS CloudWatch Monitoring Dashboard

## 1. Project Overview & Goal
Infrastructure aur application telemetry ko ek single observability screen par monitor karne ke liye JSON widget configuration (`dashboard-body.json`) ke zariye **Amazon CloudWatch Dashboard** (`amrish-capstone-performance-dashboard`) create karna.

## 2. Files in This Folder
- `dashboard-body.json` — 4-widget JSON layout definition (EC2 `CPUUtilization` & `NetworkIn`/`NetworkOut`, ALB `RequestCount` & `TargetResponseTime`, CloudWatch Logs `IncomingBytes`/`IncomingLogEvents`, aur Markdown overview card).

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Widget Layout Authoring (`dashboard-body.json`):** Compute, Load Balancer, aur Log ingestion metrics ko time-series graphs mein organize kiya.
2. **CLI Deployment:** `aws cloudwatch put-dashboard` run karke `ap-south-1` region mein dashboard provision kiya.
3. **Dashboard Verification:** CloudWatch Console aur `list-dashboards` CLI se active dashboard verify kiya.

## 4. Commands Executed & Unka Kaam
1. `aws cloudwatch put-dashboard --dashboard-name amrish-capstone-performance-dashboard --dashboard-body file://capstone/project21-cloudwatch-monitoring-dashboard/dashboard-body.json --region ap-south-1`
   - **Kaam:** `dashboard-body.json` se AWS CloudWatch mein custom performance monitoring dashboard create/update karta hai.
2. `aws cloudwatch list-dashboards --region ap-south-1 --output table`
   - **Kaam:** Deployed dashboard ka naam aur ARN CLI se verify karta hai.

## 5. Expected Output / Verification
- AWS CloudWatch Console -> Dashboards mein `amrish-capstone-performance-dashboard` ke andar sabhi 4 telemetry widgets live render hote hain.
