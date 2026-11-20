# Project 17: Log Forwarding to CloudWatch

## Steps Performed

1. **CloudWatch Agent Installation & Configuration:**
   - Installed `amazon-cloudwatch-agent` on the Linux node and configured `common-config.toml` and `amazon-cloudwatch-agent.json` to forward `/var/log/amrish-capstone/app.log` and `/var/log/syslog` to AWS CloudWatch Logs (`ap-south-1`).

2. **Log Forwarding & Verification:**
   - Started the CloudWatch Agent in `onPremise` mode (`amazon-cloudwatch-agent-ctl -a fetch-config ... -s`), generated application log entries, and verified log ingestion in `/amrish-capstone/project17-app-logs` via AWS CloudWatch / CLI.
