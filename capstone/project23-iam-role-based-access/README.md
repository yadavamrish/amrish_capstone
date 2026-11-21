# Project 23: IAM Role Based Access

## Project Goal
`ec2-trust-policy.json` ke saath IAM Role (`amrish-p23-ec2-s3-role` + `AmazonS3ReadOnlyAccess`) banakar aur EC2 Instance Profile se attach karke bina hardcoded credentials ke Amazon S3 access verify karna (`cli-test-output.txt`).

## Kya & Kaise Kiya
1. **IAM Role & Instance Profile (`ec2-trust-policy.json`):** EC2 trust policy ke saath IAM role banaya, `AmazonS3ReadOnlyAccess` attach kiya, aur Instance Profile ko EC2 instance se associate kiya.
2. **Verification (`cli-test-output.txt`):** Role association aur S3 read access verify karke output `cli-test-output.txt` mein record kiya.

## Commands Used & Unka Kaam
1. `aws iam create-role --role-name amrish-p23-ec2-s3-role --assume-role-policy-document file://capstone/project23-iam-role-based-access/ec2-trust-policy.json`
   - **Kaam:** EC2 service trust policy ke saath IAM Role create karta hai.
2. `aws iam attach-role-policy --role-name amrish-p23-ec2-s3-role --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess`
   - **Kaam:** Role ko S3 read-only permissions attach karta hai.
3. `aws ec2 associate-iam-instance-profile --instance-id $EC2_ID --iam-instance-profile Name=amrish-p23-ec2-s3-profile --region ap-south-1`
   - **Kaam:** Running EC2 instance ke saath IAM Instance Profile attach karta hai.
4. `aws ec2 describe-iam-instance-profile-associations --filters "Name=instance-id,Values=$EC2_ID" --region ap-south-1`
   - **Kaam:** Verify karta hai ki IAM Role EC2 instance par `associated` state mein active hai.
