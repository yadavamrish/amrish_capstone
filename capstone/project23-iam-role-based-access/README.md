# Project 23: Credential-Free S3 Access via EC2 IAM Roles

## 1. Project Overview & Goal
The goal of this project is to eliminate hardcoded AWS Access Keys and Secret Keys on EC2 instances by creating an **IAM Role** (`amrish-p23-ec2-s3-role` with `AmazonS3ReadOnlyAccess` and `ec2-trust-policy.json`) and attaching it via an **IAM Instance Profile** for secure, credential-free Amazon S3 access.

## 2. Files in This Folder
- `ec2-trust-policy.json` — IAM trust relationship policy allowing `ec2.amazonaws.com` to assume the role via AWS STS.
- `cli-test-output.txt` — Recorded verification output showing active Instance Profile association and successful S3 bucket listing.

## 3. Step-by-Step Implementation
1. **IAM Role & Policy Creation:** Created `amrish-p23-ec2-s3-role` using `ec2-trust-policy.json` and attached the `AmazonS3ReadOnlyAccess` managed policy.
2. **Instance Profile Attachment:** Created an Instance Profile, added the role, and associated it with the running EC2 instance.
3. **Credential-Free Access Audit:** Verified the `associated` state via `describe-iam-instance-profile-associations` and saved S3 read verification output in `cli-test-output.txt`.

## 4. Commands Executed & Purpose
1. `aws iam create-role --role-name amrish-p23-ec2-s3-role --assume-role-policy-document file://capstone/project23-iam-role-based-access/ec2-trust-policy.json`
   - **Purpose:** Creates an IAM Role trusted by the EC2 service.
2. `aws iam attach-role-policy --role-name amrish-p23-ec2-s3-role --policy-arn arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess`
   - **Purpose:** Grants read-only Amazon S3 permissions to the IAM Role.
3. `aws ec2 associate-iam-instance-profile --instance-id $EC2_ID --iam-instance-profile Name=amrish-p23-ec2-s3-profile --region ap-south-1`
   - **Purpose:** Binds the IAM Instance Profile to the running EC2 instance.
4. `aws ec2 describe-iam-instance-profile-associations --filters "Name=instance-id,Values=$EC2_ID" --region ap-south-1`
   - **Purpose:** Confirms the IAM Role is actively `associated` with the EC2 instance.

## 5. Expected Output & Verification
- The EC2 instance lists S3 buckets seamlessly using temporary STS role credentials without any static credentials stored on disk (`cli-test-output.txt`).
