# Project 02: AWS IAM & CLI Configuration

## Project Goal
Linux VM terminal se AWS Mumbai (`ap-south-1`) account ko securely aur programmatically manage karne ke liye AWS Command Line Interface (CLI v2) install karna aur IAM credentials configure karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **AWS CLI v2 Installation:** Linux host par official AWS CLI v2 binary download aur install karke CLI version verify kiya.
2. **IAM Credentials & Region Setup:** IAM user ki Access Key ID, Secret Access Key, default region (`ap-south-1`), aur default output format (`json`) ko `~/.aws/credentials` aur `~/.aws/config` mein save kiya.
3. **Authentication & Identity Verification:** AWS Security Token Service (`sts`) ke through verify kiya ki CLI sahi AWS Account ID aur IAM User/Role ke saath authenticated hai.

## Commands Used & Unka Kaam (Detailed Reference)

1. `curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip -q awscliv2.zip && sudo ./aws/install`
   - **Kaam:** Official AWS CLI v2 installer package download karta hai, unzip karta hai, aur Linux system mein globally install karta hai.
2. `aws --version`
   - **Kaam:** Installed AWS CLI ka exact version aur Python runtime verify karta hai.
3. `aws configure`
   - **Kaam:** Interactive prompt ke through AWS Access Key ID, Secret Access Key, default region (`ap-south-1`), aur output format (`json`) ko `~/.aws/credentials` aur `~/.aws/config` files mein store karta hai.
4. `aws configure list`
   - **Kaam:** Current active profile, access key source, aur configured region (`ap-south-1`) ki summary dikhata hai (bina secret key expose kiye).
5. `aws sts get-caller-identity`
   - **Kaam:** AWS Security Token Service (STS) API call karke current authenticated IAM User/Role ka `Account` ID, `UserId`, aur `Arn` return karta hai — yeh confirm karta hai ki credentials valid aur working hain.
