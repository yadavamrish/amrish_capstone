# Project 13: Containerized Workload & AWS CloudWatch Metric Alarms

## 1. Project Overview & Goal
The goal of this project is to build a containerized web workload (`Dockerfile`, `index.html`) and configure proactive **Amazon CloudWatch Metric Alarms** to detect high CPU utilization thresholds and trigger automated alerts.

## 2. Files in This Folder
- `Dockerfile` — Container build definition for the monitored web application.
- `index.html` — Web application frontend served by the container.

## 3. Step-by-Step Implementation
1. **Container Image Build:** Built and verified the containerized web app from `Dockerfile` and `index.html`.
2. **CloudWatch Alarm Configuration:** Created a CloudWatch Metric Alarm monitoring `AWS/EC2` `CPUUtilization` (`> 80%` across 2 consecutive 60-second evaluation periods).
3. **Alarm State Verification:** Inspected alarm configuration and state transitions via AWS CLI.

## 4. Commands Executed & Purpose
1. `docker build -t amrish-p13-monitored-app:v1 capstone/project13-cloudwatch-alarm/`
   - **Purpose:** Builds the monitored web application Docker image.
2. `aws cloudwatch put-metric-alarm --alarm-name amrish-p13-cpu-alarm --metric-name CPUUtilization --namespace AWS/EC2 --statistic Average --period 60 --threshold 80 --comparison-operator GreaterThanThreshold --evaluation-periods 2 --region ap-south-1`
   - **Purpose:** Creates a CloudWatch Metric Alarm that triggers when average CPU utilization exceeds 80% for 2 minutes.
3. `aws cloudwatch describe-alarms --alarm-names amrish-p13-cpu-alarm --region ap-south-1 --output table`
   - **Purpose:** Displays the alarm's active state (`OK` / `ALARM`) and threshold settings.

## 5. Expected Output & Verification
- `describe-alarms` confirms `amrish-p13-cpu-alarm` is active in `ap-south-1` and transitions to `ALARM` when CPU thresholds are breached.
