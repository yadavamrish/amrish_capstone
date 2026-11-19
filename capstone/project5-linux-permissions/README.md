# Project 5: Secure Linux Server Permissions

## Objective
Apply user-based access restrictions on a Linux server using groups, ownership, and file permissions.

## Commands Executed
- `sudo groupadd devops && sudo groupadd interns`
- `sudo useradd -m -s /bin/bash -G devops amrish_admin`
- `sudo useradd -m -s /bin/bash -G interns guest_intern`
- `sudo mkdir -p /opt/secure_project && sudo chown -R root:devops /opt/secure_project && sudo chmod -R 770 /opt/secure_project`

## Verification
- **Allowed Access (`amrish_admin`):** Successfully read `/opt/secure_project/secrets.txt`.
- **Denied Access (`guest_intern`):** Returned `Permission denied`.
