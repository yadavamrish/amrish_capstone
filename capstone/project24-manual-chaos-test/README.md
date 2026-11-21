# Project 24: Controlled Chaos Testing & Incident Recovery Runbook

## 1. Project Overview & Goal
Production resilience validate karne ke liye controlled service failure inject karna (`systemctl stop nginx`), outage impact (`HTTP 000`) observe karna, service restore karna (`systemctl start nginx`), aur exact timestamps ke saath complete incident timeline (`INCIDENT_NOTES.md`) document karna.

## 2. Files in This Folder
- `INCIDENT_NOTES.md` — Baseline ($T_0$), Failure Injection ($T_1$), Recovery ($T_2$), Root Cause Analysis (RCA), aur Mean Time to Recovery (MTTR) report.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Baseline & Failure Injection ($T_0 \rightarrow T_1$):** Nginx ka `active` state verify karne ke baad `sudo systemctl stop nginx` run karke outage simulate kiya aur `HTTP 000` (Connection Refused) record kiya.
2. **Service Recovery ($T_2$):** `sudo systemctl start nginx` se service restore ki aur `HTTP 200 OK` verify kiya.
3. **Incident Documentation:** Poora timeline aur lessons learned `INCIDENT_NOTES.md` mein save kiya.

## 4. Commands Executed & Unka Kaam
1. `sudo systemctl stop nginx`
   - **Kaam:** Chaos test ke liye running Nginx web server ko manually stop (failure inject) karta hai.
2. `systemctl is-active nginx && curl -s -o /dev/null -w "%{http_code}\n" http://localhost`
   - **Kaam:** Outage aur recovery ke dauran systemd service status (`inactive`/`active`) aur HTTP status code (`000`/`200`) check karta hai.
3. `sudo systemctl start nginx`
   - **Kaam:** Stopped web server ko wapas start karke service availability restore karta hai.

## 5. Expected Output / Verification
- Outage ke waqt `inactive` + `000` aur recovery ke baad `active` + `200` status milta hai, jiska poora audit log `INCIDENT_NOTES.md` mein recorded hai.
