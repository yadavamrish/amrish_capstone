# Project 10: Custom DNS & Domain Routing (Amazon Route 53)

## Project Goal
Amazon Route 53 ke through custom domain aur subdomain records (`A`, `ALIAS`, `CNAME`) configure karke user-friendly domain names ko AWS EC2 aur Load Balancer endpoints par route karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Hosted Zone Management:** Route 53 mein public/private Hosted Zone configure karke authoritative Name Servers (`NS`) verify kiye.
2. **DNS Record Creation:** Application endpoint ke liye `A` / `CNAME` resource record sets JSON batch ke through add kiye.
3. **DNS Resolution Verification:** `dig` aur `nslookup` utilities se domain name resolution aur TTL propagation verify kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `aws route53 list-hosted-zones --output table`
   - **Kaam:** AWS account mein configured sabhi Route 53 DNS Hosted Zones aur unke Zone IDs list karta hai.
2. `aws route53 change-resource-record-sets --hosted-zone-id $ZONE_ID --change-batch file://dns-record.json`
   - **Kaam:** Specified Hosted Zone ke andar naya `A`, `ALIAS`, ya `CNAME` DNS record create ya upsert karta hai.
3. `aws route53 list-resource-record-sets --hosted-zone-id $ZONE_ID --output table`
   - **Kaam:** Hosted Zone ke andar maujood sabhi DNS records (`NS`, `SOA`, `A`, `CNAME`) aur unke target values dikhata hai.
4. `dig +short <subdomain.domain.com>`
   - **Kaam:** DNS query bhej kar verify karta hai ki domain name exact target IP address ya ALB DNS par resolve ho raha hai.
