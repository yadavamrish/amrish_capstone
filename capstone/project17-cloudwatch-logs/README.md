# Project 17: Real-Time Central Log Forwarding to AWS CloudWatch

## 1. Project Overview & Goal
**Amazon CloudWatch Agent** configure karke Linux server ke local application logs (`/var/log/amrish-capstone/app.log`) aur system logs (`/var/log/syslog`) ko real time mein **AWS CloudWatch Logs (`ap-south-1`)** par centrally forward aur store karna.

## 2. Files in This Folder
- `amazon-cloudwatch-agent.json` — CloudWatch Agent configuration file jo monitored log file paths, target CloudWatch Log Groups (`/amrish-capstone/project17-app-logs` & `/amrish-capstone/project17-syslog`), aur 7-day retention policy define karti hai.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **CloudWatch Agent Installation:** Ubuntu/Debian Linux host par official `.deb` installer package install kiya.
2. **Agent JSON Configuration:** `amazon-cloudwatch-agent.json` mein log file mappings aur 7-day retention configure ki.
3. **Service Start & Log Stream Verification:** Agent ko `onPremise` mode mein start karke test log entries likhi aur AWS CloudWatch Console/CLI par live log streams verify kiye.

## 4. Commands Executed & Unka Kaam
1. `sudo dpkg -i -E /tmp/amazon-cloudwatch-agent.deb`
   - **Kaam:** Ubuntu/Debian Linux host par Amazon CloudWatch Agent package install karta hai.
2. `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m onPremise -c file:capstone/project17-cloudwatch-logs/amazon-cloudwatch-agent.json -s`
   - **Kaam:** JSON config validate karke CloudWatch Agent ko start karta hai.
3. `sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a status`
   - **Kaam:** Verify karta hai ki CloudWatch Agent background mein `running` state mein hai.
4. `aws logs describe-log-groups --log-group-name-prefix "/amrish-capstone" --region ap-south-1 --output table`
   - **Kaam:** CloudWatch Logs mein create hue log groups aur retention days verify karta hai.

## 5. Expected Output / Verification
- AWS CloudWatch Logs Console mein `/amrish-capstone/project17-app-logs` aur `syslog` log groups ke andar real-time log events stream hote hue dikhte hain.
