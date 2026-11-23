# Project 9: Domain Controller Setup

## Goal
Configure Windows Server Active Directory Domain Services (AD DS) and verify domain user authentication.

## Steps Performed
1. Installed the **Active Directory Domain Services (AD DS)** role on Windows Server via Server Manager.
2. Promoted the server to a Primary Domain Controller by creating a new forest (`capstone.local`).
3. Created two domain user accounts (`amrish1` and `amrish2`) inside Active Directory Users and Computers.
4. Verified domain login authentication for both users using `whoami` and `runas`.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `net user /domain` | Lists all Active Directory domain user accounts (`amrish1`, `amrish2`). |
| `net user amrish1 "CapStone@2026!" /domain /active:yes` | Sets/resets the domain user password compliant with AD complexity policy and enables the account. |
| `whoami` | Displays the currently logged-in domain user in `CAPSTONE\username` format. |
| `runas /user:CAPSTONE\amrish1 "cmd /k whoami"` | Authenticates as the domain user and opens a verified domain session. |

## Deliverables
- Login proof screenshots showing `capstone\amrish1` and `capstone\amrish2` (`screenshots/`)
