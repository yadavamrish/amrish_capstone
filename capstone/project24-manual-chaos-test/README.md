# Project 24: Controlled Chaos Testing & Incident Recovery Runbook

## 1. Project Overview & Goal
The goal of this project is to validate service resilience and incident response procedures by injecting a controlled web server outage (`systemctl stop nginx`), observing failure telemetry (`HTTP 000`), executing service recovery (`systemctl start nginx`), and documenting the full incident timeline in `INCIDENT_NOTES.md`.

## 2. Files in This Folder
- `INCIDENT_NOTES.md` — Structured incident report documenting Baseline ($T_0$), Failure Injection ($T_1$), Recovery ($T_2$), Root Cause Analysis (RCA), and Mean Time to Recovery (MTTR).

## 3. Step-by-Step Implementation
1. **Baseline & Failure Injection ($T_0 \rightarrow T_1$):** Verified healthy `active` Nginx status (`HTTP 200`), then intentionally stopped the `nginx` daemon to simulate a service crash (`inactive` / `HTTP 000`).
2. **Recovery Execution ($T_2$):** Restarted the `nginx` service via `systemctl` and verified restoration of `HTTP 200 OK` responses.
3. **Incident Documentation:** Logged exact UTC timestamps, commands, and recovery metrics inside `INCIDENT_NOTES.md`.

## 4. Commands Executed & Purpose
1. `sudo systemctl stop nginx`
   - **Purpose:** Injects a controlled service outage by stopping the running Nginx daemon.
2. `systemctl is-active nginx && curl -s -o /dev/null -w "%{http_code}\n" http://localhost`
   - **Purpose:** Audits systemd service state (`inactive` vs `active`) and HTTP response code (`000` vs `200`) during outage and recovery.
3. `sudo systemctl start nginx`
   - **Purpose:** Restores the Nginx web server and brings the endpoint back online.

## 5. Expected Output & Verification
- Outage state records `inactive` + `HTTP 000`, recovery restores `active` + `HTTP 200`, and `INCIDENT_NOTES.md` captures the complete timeline.
