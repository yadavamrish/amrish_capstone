# Project 21: Centralized AWS CloudWatch Monitoring Dashboard

## 1. Project Overview & Goal
The goal of this project is to consolidate infrastructure and application telemetry into a single observability screen by deploying a custom **Amazon CloudWatch Dashboard** (`amrish-capstone-performance-dashboard`) via JSON widget definitions (`dashboard-body.json`).

## 2. Files in This Folder
- `dashboard-body.json` — 4-widget JSON layout tracking EC2 (`CPUUtilization`, `NetworkIn`, `NetworkOut`), ALB (`RequestCount`, `TargetResponseTime`), CloudWatch Logs (`IncomingBytes`, `IncomingLogEvents`), and a Markdown summary header.

## 3. Step-by-Step Implementation
1. **Dashboard JSON Authoring (`dashboard-body.json`):** Structured time-series metric widgets across Compute, Load Balancing, and Log Ingestion namespaces.
2. **CLI Provisioning:** Deployed the dashboard to `ap-south-1` using `aws cloudwatch put-dashboard`.
3. **Visualization Verification:** Confirmed dashboard registration via CLI and inspected live graphs in the CloudWatch Console.

## 4. Commands Executed & Purpose
1. `aws cloudwatch put-dashboard --dashboard-name amrish-capstone-performance-dashboard --dashboard-body file://capstone/project21-cloudwatch-monitoring-dashboard/dashboard-body.json --region ap-south-1`
   - **Purpose:** Creates or updates the CloudWatch Dashboard using the widget definitions in `dashboard-body.json`.
2. `aws cloudwatch list-dashboards --region ap-south-1 --output table`
   - **Purpose:** Lists active CloudWatch Dashboards in `ap-south-1` to confirm deployment.

## 5. Expected Output & Verification
- `amrish-capstone-performance-dashboard` appears in AWS CloudWatch Console -> Dashboards with all 4 widgets rendering telemetry data.
