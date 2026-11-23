# Project 17: Real-Time Central Log Forwarding to AWS CloudWatch

## 1. Project Overview & Goal
The goal of this project is to install and configure the **Amazon CloudWatch Agent** (`amazon-cloudwatch-agent.json`) on a Linux host to stream local application logs (`/var/log/amrish-capstone/app.log`) and system logs (`/var/log/syslog`) in real time to **AWS CloudWatch Logs (`ap-south-1`)**.

## 2. Files in This Folder
- `amazon-cloudwatch-agent.json` — CloudWatch Agent configuration mapping local log file paths to CloudWatch Log Groups (`/amrish-capstone/project17-app-logs` and `/amrish-capstone/project17-syslog`) with a 7-day retention policy.

## 3. Step-by-Step Implementation
1. **CloudWatch Agent Installation:** Installed the official `amazon-cloudwatch-agent.deb` package on the Linux host.
2. **Agent JSON Configuration:** Defined log file paths, stream names, log groups, and 7-day retention inside `amazon-cloudwatch-agent.json`.
3. **Service Execution & Stream Verification:** Started the agent in `onPremise` mode, generated timestamped log entries, and verified real-time ingestion in CloudWatch Logs.

## 4. Commands Executed & Purpose
1. `sudo dpkg -i -E /tmp/amazon-cloudwatch-agent.deb`
   - **Purpose:** Installs the Amazon CloudWatch Agent package on Ubuntu/Debian Linux.
2. `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -c file:capstone/project17-cloudwatch-logs/amazon-cloudwatch-agent.json -s`
   - **Purpose:** Loads `amazon-cloudwatch-agent.json`, validates the configuration, and starts the agent daemon.
3. `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a status`
   - **Purpose:** Confirms that the CloudWatch Agent is actively `running`.
4. `aws logs describe-log-groups --log-group-name-prefix "/amrish-capstone" --region ap-south-1 --output table`
   - **Purpose:** Verifies that the target CloudWatch Log Groups and retention policies were created in `ap-south-1`.

## 5. Expected Output & Verification
- CloudWatch Logs Console displays live log streams inside `/amrish-capstone/project17-app-logs` and `/amrish-capstone/project17-syslog`.
