# Project 5: Secure Linux Server Permissions

## Goal
Apply Linux user and group-based file/directory access restrictions and verify allowed vs. denied access.

## Steps Performed
1. Created custom Linux groups (`developers`, `auditors`) and users (`devuser`, `audituser`).
2. Created a restricted project directory (`/opt/secure_app`) owned by `root:developers` with `750` (`rwxr-x---`) permissions.
3. Tested access as `devuser` (member of `developers` -> allowed) and as `audituser` (non-member -> `Permission denied`).

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `sudo groupadd developers && sudo groupadd auditors` | Creates separate Linux groups for role-based access. |
| `sudo useradd -m -G developers devuser` | Creates `devuser` and adds them to the `developers` group. |
| `sudo useradd -m -G auditors audituser` | Creates `audituser` outside the `developers` group. |
| `sudo mkdir -p /opt/secure_app && sudo chown root:developers /opt/secure_app` | Sets directory ownership to the `developers` group. |
| `sudo chmod 750 /opt/secure_app` | Grants full access to owner, read/execute to group, and zero access to others. |
| `su - devuser -c "ls -la /opt/secure_app"` | Verifies allowed access for an authorized group member. |
| `su - audituser -c "ls -la /opt/secure_app"` | Verifies `Permission denied` for an unauthorized user. |

## Deliverables
- Screenshots of allowed and denied access outputs (`screenshots/`)
- Short permission design write-up
