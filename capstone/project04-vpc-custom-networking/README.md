# Project 04: Custom VPC & Subnet Networking

## Project Goal
AWS Mumbai (`ap-south-1`) region mein ek isolated custom Virtual Private Cloud (VPC) network design karna jismein custom CIDR blocks, public subnets, an Internet Gateway (IGW), aur public route tables configure hon.

## Kya & Kaise Kiya (Detailed Summary)
1. **Custom VPC Creation:** `10.0.0.0/16` IPv4 CIDR block ke saath isolated VPC banaya aur DNS hostnames enable kiye.
2. **Public Subnet & Auto-Assign Public IP:** `10.0.1.0/24` (`ap-south-1a`) aur `10.0.2.0/24` (`ap-south-1b`) subnets create karke unpar auto-assign public IP enable kiya.
3. **Internet Gateway & Routing:** Internet Gateway (IGW) create karke VPC se attach kiya, custom Route Table banaya, aur `0.0.0.0/0` destination ko IGW par route karke public subnets se associate kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `aws ec2 create-vpc --cidr-block 10.0.0.0/16 --region ap-south-1 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=amrish-p04-vpc}]'`
   - **Kaam:** `10.0.0.0/16` IP range ke saath ek naya isolated AWS Virtual Private Cloud (VPC) create karta hai.
2. `aws ec2 modify-vpc-attribute --vpc-id $VPC_ID --enable-dns-hostnames "{\"Value\":true}" --region ap-south-1`
   - **Kaam:** VPC ke andar launch hone wale EC2 instances ke liye public DNS hostnames enable karta hai.
3. `aws ec2 create-subnet --vpc-id $VPC_ID --cidr-block 10.0.1.0/24 --availability-zone ap-south-1a --region ap-south-1`
   - **Kaam:** `ap-south-1a` Availability Zone mein `10.0.1.0/24` range ka subnet create karta hai.
4. `aws ec2 modify-subnet-attribute --subnet-id $SUBNET_ID --map-public-ip-on-launch --region ap-south-1`
   - **Kaam:** Is subnet mein launch hone wale instances ko automatically Public IPv4 address assign hone ki setting enable karta hai.
5. `aws ec2 create-internet-gateway --region ap-south-1 && aws ec2 attach-internet-gateway --vpc-id $VPC_ID --internet-gateway-id $IGW_ID --region ap-south-1`
   - **Kaam:** Internet Gateway create karta hai aur use custom VPC se attach karta hai taaki internet traffic flow ho sake.
6. `aws ec2 create-route-table --vpc-id $VPC_ID --region ap-south-1`
   - **Kaam:** VPC ke network traffic ko control karne ke liye ek custom Route Table banata hai.
7. `aws ec2 create-route --route-table-id $RT_ID --destination-cidr-block 0.0.0.0/0 --gateway-id $IGW_ID --region ap-south-1`
   - **Kaam:** Route table mein `0.0.0.0/0` (all external internet traffic) ko Internet Gateway par forward karne ka rule add karta hai.
8. `aws ec2 associate-route-table --subnet-id $SUBNET_ID --route-table-id $RT_ID --region ap-south-1`
   - **Kaam:** Public route table ko subnet ke saath link karta hai taaki subnet public ban jaye.
