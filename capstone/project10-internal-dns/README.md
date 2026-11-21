# Project 10: Private Internal DNS Setup with Amazon Route 53

## 1. Project Overview & Goal
The goal of this project is to configure an **Amazon Route 53 Private Hosted Zone** associated with a custom VPC to enable internal DNS service discovery (e.g., `app.amrish.internal`) instead of relying on hardcoded private IP addresses.

## 2. Key Concepts Implemented
- VPC-bound Route 53 Private Hosted Zone (`amrish.internal`).
- Internal `A` and `CNAME` DNS record management and `dig` resolution verification.

## 3. Step-by-Step Implementation
1. **Private Hosted Zone Creation:** Created a Private Hosted Zone in Route 53 linked to the target VPC ID in `ap-south-1`.
2. **Internal Record Mapping:** Added internal `A` records mapping service domain names to private EC2 IP addresses.
3. **DNS Resolution Testing:** Queried internal hostnames from within the VPC using `dig` to confirm accurate resolution.

## 4. Commands Executed & Purpose
1. `aws route53 create-hosted-zone --name amrish.internal --vpc VPCRegion=ap-south-1,VPCId=$VPC_ID --caller-reference $(date +%s)`
   - **Purpose:** Creates a VPC-scoped Route 53 Private Hosted Zone for internal domain resolution.
2. `aws route53 list-hosted-zones --output table`
   - **Purpose:** Lists active Hosted Zones and confirms private zone configuration.
3. `dig +short app.amrish.internal`
   - **Purpose:** Resolves the internal domain name and verifies it returns the expected private IPv4 address.

## 5. Expected Output & Verification
- `dig +short app.amrish.internal` resolves directly to the target internal private IP address inside the VPC.
