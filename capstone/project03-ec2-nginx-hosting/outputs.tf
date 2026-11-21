output "instance_id" {
  value = aws_instance.monitored_ec2.id
}

output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.high_cpu_alarm.alarm_name
}
