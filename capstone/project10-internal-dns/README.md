# Project 10: Internal DNS Setup (Route 53)

## Project Goal
Amazon Route 53 Private Hosted Zone configure karke VPC ke andar internal service discovery aur private domain name resolution (`*.internal`) enable karna.

## Kya & Kaise Kiya
1. **Private Hosted Zone Creation:** Custom VPC ke saath linked Route 53 Private Hosted Zone banaya.
2. **Internal A/CNAME Records:** Backend aur web servers ke private IP addresses ke liye internal DNS records add karke `dig` se resolve kiya.

## Commands Used & Unka Kaam
1. `aws route53 create-hosted-zone --name amrish.internal --vpc VPCRegion=ap-south-1,VPCId=$VPC_ID --caller-reference $(date +%s)`
   - **Kaam:** VPC ke andar internal DNS resolution ke liye Route 53 Private Hosted Zone create karta hai.
2. `aws route53 list-hosted-zones --output table`
   - **Kaam:** Created Hosted Zone ID aur configuration verify karta hai.
3. `dig +short app.amrish.internal`
   - **Kaam:** VPC ke andar internal DNS record resolution verify karta hai.
