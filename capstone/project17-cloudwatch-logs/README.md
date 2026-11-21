# Project 17: Central Log Forwarding to AWS CloudWatch

## Project Goal
Linux server/host ke local application aur system logs ko Amazon CloudWatch Agent ke through real time mein AWS CloudWatch Logs (`ap-south-1`) par centrally stream karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Amazon CloudWatch Agent Installation:** Ubuntu/Debian Linux host par official `.deb` installer package download aur install kiya.
2. **AWS Credentials & Log Group Configuration:** `/opt/aws/amazon-cloudwatch-agent/etc/common-config.toml` mein `~/.aws/credentials` profile link kiya aur `amazon-cloudwatch-agent.json` mein `/var/log/amrish-capstone/app.log` aur `/var/log/syslog` ko 7-day retention ke saath map kiya.
3. **Agent Execution & Stream Verification:** Agent ko `onPremise` mode mein start kiya, timestamped log entries likhi, aur AWS CloudWatch Console/CLI par live log ingestion verify kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `wget -q https://amazoncloudwatch-agent-ap-south-1.s3.ap-south-1.amazonaws.com/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb -O /tmp/amazon-cloudwatch-agent.deb && sudo dpkg -i -E /tmp/amazon-cloudwatch-agent.deb`
   - **Kaam:** Ubuntu/Debian Linux host ke liye official Amazon CloudWatch Agent download aur install karta hai.
2. `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -c file:amazon-cloudwatch-agent.json -s`
   - **Kaam:** JSON configuration file ko validate karke CloudWatch Agent ko `onPremise` mode mein start karta hai.
3. `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a status`
   - **Kaam:** Check karta hai ki CloudWatch Agent background mein `running` hai ya `stopped`.
4. `echo "$(date -u '+%Y-%m-%dT%H:%M:%SZ') [HEALTH] Application health check passed - Status 200 OK" >> /var/log/amrish-capstone/app.log`
   - **Kaam:** Monitored log file mein timestamped test log entry append karta hai jo automatically CloudWatch par stream hoti hai.
5. `aws logs describe-log-groups --log-group-name-prefix "/amrish-capstone" --region ap-south-1 --output table`
   - **Kaam:** AWS CloudWatch Logs mein `/amrish-capstone/project17-app-logs` aur `syslog` log groups create ho gaye hain ya nahi, CLI se verify karta hai.
