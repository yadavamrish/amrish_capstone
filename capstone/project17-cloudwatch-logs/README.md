# Project 17: Central Log Forwarding

## Project Goal
Amazon CloudWatch Agent (`amazon-cloudwatch-agent.json`) ke through Linux host ke application logs (`/var/log/amrish-capstone/app.log`) aur system logs (`/var/log/syslog`) ko centrally AWS CloudWatch Logs (`ap-south-1`) par stream karna.

## Kya & Kaise Kiya
1. **CloudWatch Agent Configuration (`amazon-cloudwatch-agent.json`):** JSON file mein `app.log` aur `/var/log/syslog` ke log group names (`/amrish-capstone/project17-app-logs` & `syslog`) aur 7-day retention policy define ki.
2. **Agent Start & Log Verification:** `amazon-cloudwatch-agent-ctl` se agent start kiya aur AWS CloudWatch Console/CLI par real-time log streams verify kiye.

## Commands Used & Unka Kaam
1. `sudo dpkg -i -E /tmp/amazon-cloudwatch-agent.deb`
   - **Kaam:** Ubuntu/Debian Linux host par Amazon CloudWatch Agent package install karta hai.
2. `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -c file:capstone/project17-cloudwatch-logs/amazon-cloudwatch-agent.json -s`
   - **Kaam:** `amazon-cloudwatch-agent.json` load karke CloudWatch Agent ko validate aur start karta hai.
3. `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a status`
   - **Kaam:** Verify karta hai ki CloudWatch Agent `running` state mein active hai.
4. `aws logs describe-log-groups --log-group-name-prefix "/amrish-capstone" --region ap-south-1 --output table`
   - **Kaam:** CloudWatch Logs mein create hue log groups aur retention settings ko CLI se verify karta hai.
