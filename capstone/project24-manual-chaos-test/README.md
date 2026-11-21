# Project 24: Manual Chaos Test

## Project Goal
Controlled service failure inject karke system outage behavior test karna, service recovery execute karna, aur exact timestamps ke saath Incident & Recovery Report (`INCIDENT_NOTES.md`) record karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Baseline & Failure Injection ($T_0 \rightarrow T_1$):** Running `nginx` web service ka baseline `active` status verify karne ke baad `systemctl stop nginx` se manual outage inject kiya aur `HTTP 000` (Connection Refused) failure confirm kiya.
2. **Recovery Execution ($T_2$):** `systemctl start nginx` run karke web service restore ki aur `active` state ke saath `HTTP 200 OK` recovery verify ki.
3. **Incident Documentation:** Poori timeline, root cause, aur recovery metrics ko `INCIDENT_NOTES.md` mein document kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `sudo systemctl stop nginx`
   - **Kaam:** Controlled chaos engineering test ke liye running Nginx web server ko manually stop (failure inject) karta hai.
2. `systemctl is-active nginx`
   - **Kaam:** Outage aur recovery ke dauran systemd service ka exact state (`inactive` vs `active`) check karta hai.
3. `curl -s -o /dev/null -w "%{http_code}" http://localhost`
   - **Kaam:** Local web endpoint ka HTTP status code check karta hai (outage mein `000` aur recovery ke baad `200`).
4. `sudo systemctl start nginx`
   - **Kaam:** Stopped web server ko wapas start karke service availability restore karta hai.
