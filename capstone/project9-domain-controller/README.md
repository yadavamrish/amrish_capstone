# Project 9: Windows Domain Controller Setup

## Maine Kya-Kya Kiya (Steps Performed)

1. **Windows Server EC2 Launch Kiya:**
   - AWS Mumbai region (`ap-south-1`) mein ek Windows Server EC2 instance (`Amrish-Windows-DC` - `i-0f208aa45f2be7190`) launch kiya.
   - Security Group mein RDP port (`3389`) allow kiya.
   - `.pem` key file se Administrator password decrypt karke Windows **Remote Desktop Connection (`mstsc`)** se server mein login kiya.

2. **AD DS Install Kiya Aur Domain Controller Banaya:**
   - Windows Server ke andar PowerShell (Administrator) open karke Active Directory Domain Services (`AD-Domain-Services`) install kiya:
     ```powershell
     Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
     ```
   - Server ko Domain Controller promote karke naya domain **`amrish.local`** (`Windows2025Domain`) create kiya:
     ```powershell
     Install-ADDSForest -DomainName "amrish.local" -SafeModeAdministratorPassword (ConvertTo-SecureString "Admin@12345" -AsPlainText -Force) -InstallDns -Force
     ```
   - Automatic restart ke baad dobara RDP se `AMRISH\Administrator` login kiya.

3. **2 Domain Users Banaye Aur RDP Permission Di:**
   - PowerShell se 2 domain users (`user1` aur `user2`) create kiye:
     ```powershell
     New-ADUser -Name "Amrish User1" -SamAccountName "user1" -UserPrincipalName "user1@amrish.local" -AccountPassword (ConvertTo-SecureString "Welcome@123" -AsPlainText -Force) -Enabled $true -PasswordNeverExpires$true
     New-ADUser -Name "Amrish User2" -SamAccountName "user2" -UserPrincipalName "user2@amrish.local" -AccountPassword (ConvertTo-SecureString "Welcome@123" -AsPlainText -Force) -Enabled $true -PasswordNeverExpires$true
     ```
   - Dono users ko `Remote Desktop Users` group mein add kiya aur Domain Controller par RDP login allow karne ke liye Group Policy (`gpupdate /force`) update ki.

4. **Verification Aur Login Proof Liya:**
   - `Get-ADDomain`, `Get-ADUser`, aur `whoami` commands run karke domain (`amrish.local`), dono active users (`user1@amrish.local`, `user2@amrish.local`), aur domain login (`amrish\administrator` & `amrish\user1`) verify kiya.
   - Login proof screenshots capture karke portal par submit kiye aur billing bachane ke liye EC2 instance terminate kar diya.
