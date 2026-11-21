# Project 18: Proactive Metric Alerting (CloudWatch Alarms & SNS)

## Project Goal
Infrastructure bottlenecks ya performance degradation ko proactively detect karne ke liye Amazon CloudWatch Metric Alarms aur Amazon SNS email/notification alerts configure karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **SNS Topic & Email Subscription:** `amrish-capstone-alerts` SNS topic banaya aur email endpoint subscribe karke confirmation verify kiya.
2. **CloudWatch Threshold Alarm Creation:** EC2 `CPUUtilization` metric par `> 80%` threshold ke saath CloudWatch Alarm configure kiya aur alert action ko SNS Topic ARN se link kiya.
3. **Alarm State & Trigger Testing:** `set-alarm-state` ke through `ALARM` state simulate karke notification delivery aur alarm history verify ki.

## Commands Used & Unka Kaam (Detailed Reference)

1. `aws sns create-topic --name amrish-capstone-alerts --region ap-south-1`
   - **Kaam:** Alert notifications publish karne ke liye ek naya Amazon SNS topic create karta hai aur `TopicArn` return karta hai.
2. `aws sns subscribe --topic-arn $TOPIC_ARN --protocol email --notification-endpoint amrishrock2002@gmail.com --region ap-south-1`
   - **Kaam:** SNS topic par email subscriber register karta hai taaki alarm trigger hone par email alert mile.
3. `aws cloudwatch put-metric-alarm --alarm-name amrish-p18-high-cpu-alarm --metric-name CPUUtilization --namespace AWS/EC2 --statistic Average --period 60 --threshold 80 --comparison-operator GreaterThanThreshold --evaluation-periods 2 --alarm-actions $TOPIC_ARN --region ap-south-1`
   - **Kaam:** EC2 CPU utilization 2 consecutive minutes tak 80% se upar rehne par trigger hone wala CloudWatch Alarm set karta hai.
4. `aws cloudwatch set-alarm-state --alarm-name amrish-p18-high-cpu-alarm --state-value ALARM --state-reason "Testing SNS alert notification" --region ap-south-1`
   - **Kaam:** Alarm ko manually `ALARM` state mein daal kar SNS notification flow ko end-to-end test karta hai.
