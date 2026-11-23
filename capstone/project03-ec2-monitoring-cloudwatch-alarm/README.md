# Project 3: EC2 State Monitoring with CloudWatch Alarm

## Goal
Monitor EC2 CPU utilization and trigger a CloudWatch alarm when CPU usage spikes above the threshold.

## Steps Performed
1. Provisioned an EC2 instance using Terraform (`aws_instance`).
2. Created an `aws_cloudwatch_metric_alarm` resource monitoring `CPUUtilization` (`AWS/EC2` namespace) with a threshold (e.g., > 70% for 1-2 evaluation periods).
3. Simulated a CPU spike on the EC2 instance using the `stress` utility.
4. Verified that the CloudWatch Alarm transitioned from `OK` to `In alarm` state.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `terraform apply -auto-approve` | Deploys the EC2 instance and CloudWatch CPU alarm. |
| `sudo apt-get install -y stress` | Installs the Linux CPU stress-testing tool on the EC2 instance. |
| `stress --cpu 2 --timeout 300` | Generates high CPU load for 5 minutes to breach the alarm threshold. |
| `aws cloudwatch describe-alarms --alarm-names <ALARM_NAME>` | Checks the current state (`OK` vs `ALARM`) via AWS CLI. |

## Deliverables
- Terraform code in GitHub repository
- Screenshot of CloudWatch Alarm in `In alarm` state (`screenshots/`)
