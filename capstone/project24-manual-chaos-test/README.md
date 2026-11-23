# Project 24: Manual Chaos Test

## Goal
Simulate a service outage, execute manual recovery procedures, and document incident response notes and recovery verification.

## Steps Performed
1. Checked baseline health of the running web service (`nginx`) and confirmed `HTTP 200 OK`.
2. Intentionally stopped the `nginx` service (`systemctl stop nginx`) to simulate an unexpected application crash.
3. Observed service failure (`Connection refused` / unhealthy status), recorded downtime timestamp, and restarted the service (`systemctl start nginx`).
4. Verified full recovery (`active (running)` and `HTTP 200 OK`) and documented incident notes.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `sudo systemctl status nginx` | Checks baseline service health before injecting failure. |
| `sudo systemctl stop nginx` | Simulates a service outage by forcefully stopping the web server. |
| `curl -I http://localhost` | Confirms service unavailability (`Failed to connect`) during the chaos test. |
| `sudo systemctl start nginx && sudo systemctl status nginx` | Restarts the failed service and verifies it returns to `active (running)`. |

## Incident Notes
- **Fault Injected:** Stopped `nginx` web server daemon manually to test failure detection and recovery SOP.
- **Impact:** HTTP traffic on port 80 returned connection refused during the outage window.
- **Resolution & Recovery:** Restarted `nginx` via `systemctl`; verified service status `active (running)` and `HTTP 200 OK` response within < 1 minute.

## Deliverables
- Incident notes and recovery verification screenshots (`screenshots/`)
