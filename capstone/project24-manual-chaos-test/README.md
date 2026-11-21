# Project 24: Manual Chaos Test

## Project Goal
Controlled service outage inject karke (`systemctl stop nginx`) failure behavior test karna, service restore karna (`systemctl start nginx`), aur exact incident timeline ko `INCIDENT_NOTES.md` mein document karna.

## Kya & Kaise Kiya
1. **Failure Injection & Outage Verification:** Running `nginx` service stop karke `inactive` state aur `HTTP 000` (Connection Refused) outage confirm kiya.
2. **Recovery & Incident Notes (`INCIDENT_NOTES.md`):** Service restart karke `active` state aur `HTTP 200 OK` recovery verify ki aur timestamps ke saath `INCIDENT_NOTES.md` update kiya.

## Commands Used & Unka Kaam
1. `sudo systemctl stop nginx`
   - **Kaam:** Chaos test ke liye Nginx web server ko manually stop (outage simulate) karta hai.
2. `systemctl is-active nginx && curl -s -o /dev/null -w "%{http_code}\n" http://localhost`
   - **Kaam:** Outage aur recovery ke dauran systemd service status aur HTTP response code check karta hai.
3. `sudo systemctl start nginx`
   - **Kaam:** Web server ko wapas start karke service availability restore karta hai.
