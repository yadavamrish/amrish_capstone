resource "aws_instance" "monitored_ec2" {
  ami                         = "ami-0f58b397bc5c1f2e8"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0391feeb69966b00f"
  associate_public_ip_address = true

  user_data = <<-EOF2
#!/bin/bash
apt-get update -y
apt-get install -y stress
# Generate high CPU load on 2 workers for 15 minutes (900 seconds)
stress --cpu 2 --timeout 900 &
EOF2

  tags = {
    Name = "Amrish-Project3-Monitored-EC2"
  }
}

resource "aws_sns_topic" "cpu_alert_topic" {
  name = "amrish-ec2-cpu-alert-topic"
}

resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.cpu_alert_topic.arn
  protocol  = "email"
  endpoint  = "amrish.a.yadav@accenture.com"
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "Amrish-EC2-High-CPU-Alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "Triggers when EC2 CPU utilization exceeds 50%"
  treat_missing_data  = "notBreaching"

  dimensions = {
    InstanceId = aws_instance.monitored_ec2.id
  }

  alarm_actions = [aws_sns_topic.cpu_alert_topic.arn]
}
