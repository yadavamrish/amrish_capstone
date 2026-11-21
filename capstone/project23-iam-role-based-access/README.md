# Project 23: IAM Role Based Access

## Project Goal
EC2 instance par bina hardcoded AWS Access Keys ya Secret Keys store kiye, ek IAM Role (`AmazonS3ReadOnlyAccess`) aur Instance Profile attach karke Amazon S3 ko securely access karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **IAM Role & Trust Policy Creation:** `ec2.amazonaws.com` trust policy ke saath `amrish-p23-ec2-s3-role` banaya aur us par `AmazonS3ReadOnlyAccess` managed policy attach ki.
2. **Instance Profile Association:** `amrish-p23-ec2-s3-profile` instance profile banakar role ko usmein add kiya aur running EC2 instance ke saath associate kiya.
3. **CLI Access Verification:** `describe-iam-instance-profile-associations` se `associated` state aur `aws s3 ls` se S3 bucket read access verify karke `cli-test-output.txt` mein save kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `aws iam create-role --role-name amrish-p23-ec2-s3-role --assume-role-policy-document file://capstone/project23-iam-role-ec2/ec2-trust-policy.json`
   - **Kaam:** EC2 service ko assume karne ki permission ke saath ek naya IAM Role create karta hai.
2. `aws iam attach-role-policy --role-name amrish-p23-ec2-s3-role --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess`
   - **Kaam:** Created IAM Role ko S3 buckets aur objects read karne ki permission attach karta hai.
3. `aws iam create-instance-profile --instance-profile-name amrish-p23-ec2-s3-profile && aws iam add-role-to-instance-profile --instance-profile-name amrish-p23-ec2-s3-profile --role-name amrish-p23-ec2-s3-role`
   - **Kaam:** EC2 instance par role attach karne ke liye required Instance Profile container banakar usmein IAM Role add karta hai.
4. `aws ec2 associate-iam-instance-profile --instance-id $EC2_ID --iam-instance-profile Name=amrish-p23-ec2-s3-profile --region ap-south-1`
   - **Kaam:** Running EC2 instance ke saath IAM Instance Profile ko link karta hai.
5. `aws ec2 describe-iam-instance-profile-associations --filters "Name=instance-id,Values=$EC2_ID" --region ap-south-1 --output table`
   - **Kaam:** Verify karta hai ki IAM Instance Profile EC2 instance par `associated` state mein active hai.
