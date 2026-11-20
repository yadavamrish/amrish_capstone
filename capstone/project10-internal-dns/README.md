# Project 10: Internal DNS Setup

## Maine Kya-Kya Kiya (Steps Performed)

1. **BIND9 DNS Server Deploy Kiya:**
   - Linux VM par `bind9`, `bind9utils`, aur `dnsutils` packages install kiye.
   - `/etc/bind/named.conf.local` mein `amrish.local` forward lookup zone configure kiya.

2. **Web Server Ke Liye A Record Create Kiya:**
   - Zone file (`/etc/bind/db.amrish.local`) create karke `web.amrish.local` hostname ko server ke IP address par map karne ke liye ek **A (Address) Record** add kiya.

3. **Validation Aur `nslookup` Proof Liya:**
   - `named-checkconf` aur `named-checkzone` se configuration verify karke `bind9` service restart ki.
   - `nslookup web.amrish.local 127.0.0.1` run karke hostname resolution confirm kiya aur proof screenshot submit kiya.
