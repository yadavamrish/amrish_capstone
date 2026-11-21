# Project 23: Credential-Free S3 Access via EC2 IAM Roles

## 1. Project Overview & Goal
EC2 instance par koi bhi hardcoded AWS Access Key ya Secret Key store kiye bina, **IAM Role** (`amrish-p23-ec2-s3-role` with `AmazonS3ReadOnlyAccess`) aur **Instance Profile** attach karke Amazon S3 ko securely access karna.

## 2. Files in This Folder
- `ec2-trust-policy.json` — IAM trust policy document jo `ec2.amazonaws.com` service ko role assume karne ki permission deta hai.
- `cli-test-output.txt` — IAM Instance Profile association aur `aws s3 ls` verification output record.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **IAM Role & Policy Setup:** `ec2-trust-policy.json` ke saath IAM Role banaya aur `AmazonS3ReadOnlyAccess` managed policy attach ki.
2. **Instance Profile Association:** Instance Profile banakar role ko add kiya aur running EC2 instance se associate kiya.
3. **CLI Access Audit:** `describe-iam-instance-profile-associations` aur `aws s3 ls` run karke result `cli-test-output.txt` mein verify kiya.

## 4. Commands Executed & Unka Kaam
1. `aws iam create-role --role-name amrish-p23-ec2-s3-role --assume-role-policy-document file://capstone/project23-iam-role-based-access/ec2-trust-policy.json`
   - **Kaam:** EC2 trust policy ke saath naya IAM Role create karta hai.
2. `aws iam attach-role-policy --role-name amrish-p23-ec2-s3-role --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess`
   - **Kaam:** IAM Role ko S3 buckets read karne ki permission attach karta hai.
3. `aws ec2 associate-iam-instance-profile --instance-id $EC2_ID --iam-instance-profile Name=amrish-p23-ec2-s3-profile --region ap-south-1`
   - **Kaam:** Running EC2 instance ke saath IAM Instance Profile attach karta hai.
4. `aws ec2 describe-iam-instance-profile-associations --filters "Name=instance-id,Values=$EC2_ID" --region ap-south-1`
   - **Kaam:** Verify karta hai ki IAM Role EC2 instance par `associated` state mein active hai.

## 5. Expected Output / Verification
- EC2 instance bina `~/.aws/credentials` ke STS temporary role credentials use karke S3 buckets list kar pata hai (`cli-test-output.txt`).
