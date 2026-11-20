# Project 15: Automate Server Config with Ansible

## Steps Performed

1. **Ansible Controller Setup:**
   - Installed Ansible on the Linux control node and configured passwordless SSH authentication (`~/.ssh/id_rsa`) for managed node automation.
   - Created `inventory.ini` defining the `[webservers]` target group.

2. **Web Server Automation Playbook:**
   - Authored `install_webserver.yml` to install Nginx, configure port `8088`, deploy a custom HTML page, and start/enable the Nginx service.
   - Verified connectivity via `ansible all -i inventory.ini -m ping` and executed `ansible-playbook -i inventory.ini install_webserver.yml`, confirming live web server response on `http://localhost:8088`.
