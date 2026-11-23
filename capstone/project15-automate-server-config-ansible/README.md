# Project 15: Automate Server Config with Ansible

## Goal
Automate remote web server installation and configuration across target EC2 nodes using an Ansible playbook.

## Steps Performed
1. Set up Ansible on the control node and configured an `inventory.ini` file with target EC2 IP and SSH key.
2. Tested SSH connectivity using Ansible's `ping` module.
3. Wrote an Ansible playbook (`setup-webserver.yml`) to update packages, install Nginx, deploy `index.html`, and enable the service.
4. Executed the playbook and verified the live webpage on the managed server.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `ansible all -i inventory.ini -m ping` | Verifies passwordless SSH connectivity and Python availability on target nodes. |
| `ansible-playbook -i inventory.ini setup-webserver.yml --syntax-check` | Checks the YAML playbook syntax before execution. |
| `ansible-playbook -i inventory.ini setup-webserver.yml` | Executes tasks remotely to install Nginx, copy webpage files, and start the service. |
| `curl http://<TARGET-EC2-IP>` | Confirms that Nginx is serving the deployed webpage. |

## Deliverables
- `inventory.ini` and `setup-webserver.yml` playbook
- Ansible execution and browser proof screenshots (`screenshots/`)
