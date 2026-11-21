# Project 21: CloudWatch Monitoring Dashboard

## Goal
Visualize infrastructure and application performance metrics in real time using Amazon CloudWatch Dashboards[cite: 2].

## Steps Performed
1. **Designed Dashboard Layout (`dashboard-body.json`):** Configured time-series widgets for EC2 (`CPUUtilization`, `NetworkIn`, `NetworkOut`), Application Load Balancer (`RequestCount`, `TargetResponseTime`), and CloudWatch Logs ingestion (`IncomingBytes`, `IncomingLogEvents`).
2. **Provisioned Dashboard via AWS CLI:** Deployed `amrish-capstone-performance-dashboard` in `ap-south-1` using `aws cloudwatch put-dashboard`[cite: 2].
3. **Verified Visualization:** Confirmed all performance widgets render live telemetry in the AWS CloudWatch Console[cite: 2].
