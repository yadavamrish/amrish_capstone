# Project 10: Internal DNS Setup

## Goal
Deploy an internal DNS server and resolve internal web server hostnames to private IP addresses.

## Steps Performed
1. Installed and configured **BIND9** DNS server on Ubuntu Linux.
2. Defined a forward lookup zone (`amrish.local`) in `/etc/bind/named.conf.local`.
3. Created the zone file (`/etc/bind/db.amrish.local`) with `NS` and `A` records mapping `web.amrish.local` to `10.5.1.250`.
4. Validated DNS configuration syntax, restarted `bind9`, and tested hostname resolution using `nslookup`.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `sudo apt-get install -y bind9 bind9utils dnsutils` | Installs the BIND9 DNS server and DNS lookup utilities (`nslookup`, `dig`). |
| `sudo named-checkconf` | Validates `/etc/bind/named.conf` syntax for configuration errors. |
| `sudo named-checkzone amrish.local /etc/bind/db.amrish.local` | Verifies the zone file records and serial number syntax. |
| `sudo systemctl restart bind9` | Reloads BIND9 service to apply the new DNS zone and A records. |
| `nslookup web.amrish.local 127.0.0.1` | Queries the local DNS server to prove `web.amrish.local` resolves to `10.5.1.250`. |

## Deliverables
- `nslookup` resolution proof screenshot (`screenshots/`)
