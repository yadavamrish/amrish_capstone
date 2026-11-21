# Project 13: CloudWatch Alarm & Containerized App

## Project Goal
Containerized web workload (`Dockerfile`, `index.html`) ke saath Amazon CloudWatch Metric Alarms configure karna taaki high CPU/resource utilization par automated alerts trigger hon.

## Kya & Kaise Kiya
1. **Containerized Workload (`Dockerfile` & `index.html`):** Monitored web application container image build ki.
2. **CloudWatch Metric Alarm Setup:** `CPUUtilization` threshold breach hone par SNS notification trigger karne ke liye CloudWatch Alarm configure kiya.

## Commands Used & Unka Kaam
1. `docker build -t amrish-p13-monitored-app:v1 capstone/project13-cloudwatch-alarm/`
   - **Kaam:** Project 13 ke `Dockerfile` aur `index.html` se application image build karta hai.
2. `aws cloudwatch put-metric-alarm --alarm-name amrish-p13-cpu-alarm --metric-name CPUUtilization --namespace AWS/EC2 --statistic Average --period 60 --threshold 80 --comparison-operator GreaterThanThreshold --evaluation-periods 2 --region ap-south-1`
   - **Kaam:** CPU utilization 80% se upar jane par trigger hone wala CloudWatch Alarm create karta hai.
3. `aws cloudwatch describe-alarms --alarm-names amrish-p13-cpu-alarm --region ap-south-1 --output table`
   - **Kaam:** Created CloudWatch Alarm ka state (`OK` / `ALARM`) aur threshold verify karta hai.
