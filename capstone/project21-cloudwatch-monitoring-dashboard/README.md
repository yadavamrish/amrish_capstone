# Project 21: CloudWatch Monitoring Dashboard

## Goal
Visualize key infrastructure performance metrics in a unified Amazon CloudWatch Monitoring Dashboard.

## Steps Performed
1. Opened Amazon CloudWatch Dashboards and created a custom dashboard (`Capstone-Infra-Dashboard`).
2. Added line and number widgets for **EC2 CPUUtilization**, **NetworkIn / NetworkOut**, **DiskReadOps / DiskWriteOps**, and **ALB RequestCount**.
3. Configured auto-refresh intervals and saved the dashboard layout.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `aws cloudwatch list-dashboards` | Lists created CloudWatch dashboards via CLI to confirm provisioning. |
| `aws cloudwatch get-dashboard --dashboard-name Capstone-Infra-Dashboard` | Retrieves the JSON widget configuration of the monitoring dashboard. |

## Deliverables
- Screenshot of the CloudWatch Monitoring Dashboard displaying live metrics (`screenshots/`)
