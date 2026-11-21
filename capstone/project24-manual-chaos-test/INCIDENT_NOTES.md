# Project 24: Manual Chaos Test - Incident & Recovery Report

- **Incident ID:** INC-2026-P24-001
- **Engineer:** Amrish Yadav (`amrish071`)
- **Target Service:** `nginx.service` (Web Server)
- **Environment:** Linux Host (`AZLTT0222435e27`)

## Timeline & Observations
1. **Baseline Check (2026-11-21T19:28:52Z):** Service state was `active`.
2. **Failure Injection (2026-11-21T19:28:52Z):** Manually stopped `nginx` via `systemctl stop nginx`.
   - Service State: `inactive`
   - Endpoint HTTP Response: `200` (Connection Refused / Service Unavailable)
3. **Recovery Action (2026-11-21T19:28:55Z):** Executed `systemctl start nginx` to restore service availability.
   - Service State: `active`
   - Endpoint HTTP Response: `200` (Healthy)

## Root Cause & Remediation Summary
- **Cause:** Simulated manual service termination (Chaos Engineering test).
- **Resolution:** Service restarted cleanly within 3 seconds with zero data loss and full HTTP 200 recovery.
