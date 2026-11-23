# Project 17: Log Forwarding to CloudWatch

## Goal
Forward Linux/application logs from an EC2 instance to Amazon CloudWatch Logs for centralized monitoring.

## Steps Performed
1. Attached an IAM role with `CloudWatchAgentServerPolicy` to the EC2 instance.
2. Installed the `amazon-cloudwatch-agent` package on the Linux server.
3. Configured `/opt/aws/amazon-cloudwatch-agent/bin/config.json` to ship `/var/log/syslog` and `/var/log/nginx/access.log` to a CloudWatch Log Group.
4. Started the CloudWatch Agent and verified real-time log streams in the AWS CloudWatch console.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `sudo apt-get install -y amazon-cloudwatch-agent` | Installs the official AWS CloudWatch Logs agent on Ubuntu. |
| `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json` | Loads the log-forwarding configuration and starts the agent service. |
| `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status` | Confirms the CloudWatch agent is `running`. |

## Deliverables
- CloudWatch Log Group / Log Stream dashboard screenshot (`screenshots/`)
