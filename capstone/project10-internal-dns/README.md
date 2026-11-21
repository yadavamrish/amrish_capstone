# Project 10: Private Internal DNS Setup with Amazon Route 53

## 1. Project Overview & Goal
Amazon Route 53 **Private Hosted Zone** configure karke VPC ke andar private service discovery enable karna, taaki internal servers hardcoded private IPs ke bajay human-readable internal domain names (e.g., `app.amrish.internal`) se ek-doosre ko access kar sakein.

## 2. Key Concepts Implemented
- VPC-associated Route 53 Private Hosted Zone (`amrish.internal`).
- Internal `A` aur `CNAME` DNS record management aur `dig` DNS resolution testing.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Private Hosted Zone Creation:** Custom VPC ID aur `ap-south-1` region ke saath Route 53 Private Hosted Zone create kiya.
2. **Internal Record Mapping:** Application aur database servers ke private IPs ko internal DNS records se map kiya.
3. **Resolution Verification:** VPC ke andar se `dig` run karke internal DNS resolution verify kiya.

## 4. Commands Executed & Unka Kaam
1. `aws route53 create-hosted-zone --name amrish.internal --vpc VPCRegion=ap-south-1,VPCId=$VPC_ID --caller-reference $(date +%s)`
   - **Kaam:** Specified VPC ke andar internal DNS queries resolve karne ke liye Private Hosted Zone banata hai.
2. `aws route53 list-hosted-zones --output table`
   - **Kaam:** Created Hosted Zone ID aur private zone flag verify karta hai.
3. `dig +short app.amrish.internal`
   - **Kaam:** Internal domain name kis private IP par resolve ho raha hai, verify karta hai.

## 5. Expected Output / Verification
- `dig +short app.amrish.internal` exact internal private IPv4 address return karta hai.
