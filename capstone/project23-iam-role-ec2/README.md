# Project 23: IAM Role Based Access

## Goal
Enforce secure, credential-free access from EC2 to Amazon S3 using an IAM Role and Instance Profile[cite: 4].

## Steps Performed
1. Created IAM role `amrish-p23-ec2-s3-role` with `AmazonS3ReadOnlyAccess` and instance profile `amrish-p23-ec2-s3-profile`[cite: 4].
2. Associated the IAM instance profile with EC2 and verified access via AWS CLI (`cli-test-output.txt`)[cite: 4].
