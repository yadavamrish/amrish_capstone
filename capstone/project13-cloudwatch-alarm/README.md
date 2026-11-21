# Project 13: Containerized Workload & AWS CloudWatch Metric Alarms

## 1. Project Overview & Goal
Containerized web application (`Dockerfile`, `index.html`) ke saath **Amazon CloudWatch Metric Alarms** configure karna taaki high CPU/resource utilization threshold breach hone par automated incident alerts trigger hon.

## 2. Files in This Folder
- `Dockerfile` — Monitored web application container image build definition.
- `index.html` — Application frontend webpage.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Containerized App Build:** `Dockerfile` aur `index.html` se application image build karke run ki.
2. **CloudWatch Alarm Configuration:** `AWS/EC2` `CPUUtilization` metric par `> 80%` threshold (2 consecutive 60-second periods) ke saath CloudWatch Alarm create kiya.
3. **Alarm State Verification:** `describe-alarms` aur `set-alarm-state` ke through alarm triggering verify ki.

## 4. Commands Executed & Unka Kaam
1. `docker build -t amrish-p13-monitored-app:v1 capstone/project13-cloudwatch-alarm/`
   - **Kaam:** Project 13 ke `Dockerfile` aur `index.html` se container image build karta hai.
2. `aws cloudwatch put-metric-alarm --alarm-name amrish-p13-cpu-alarm --metric-name CPUUtilization --namespace AWS/EC2 --statistic Average --period 60 --threshold 80 --comparison-operator GreaterThanThreshold --evaluation-periods 2 --region ap-south-1`
   - **Kaam:** CPU utilization 80% se upar rehne par trigger hone wala CloudWatch Metric Alarm create karta hai.
3. `aws cloudwatch describe-alarms --alarm-names amrish-p13-cpu-alarm --region ap-south-1 --output table`
   - **Kaam:** Alarm ka current state (`OK` / `ALARM`) aur threshold configuration verify karta hai.

## 5. Expected Output / Verification
- CloudWatch Console aur CLI output mein `amrish-p13-cpu-alarm` active dikhta hai aur threshold breach hone par `ALARM` state mein transition karta hai.
