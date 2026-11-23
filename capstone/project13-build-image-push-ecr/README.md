# Project 13: Build Image and Push to ECR

## Goal
Build a Docker container image locally and push it to a private Amazon Elastic Container Registry (ECR) repository.

## Steps Performed
1. Created a private ECR repository (`capstone-app`) in AWS.
2. Authenticated local Docker CLI to the AWS ECR registry using `aws ecr get-login-password`.
3. Built the Docker image, tagged it with the ECR repository URI, and pushed it to ECR.
4. Verified the pushed image tag and digest in the AWS ECR console.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `aws ecr create-repository --repository-name capstone-app` | Creates a private container image repository in AWS ECR. |
| `aws ecr get-login-password --region ap-south-1 \| docker login --username AWS --password-stdin <ACCOUNT_ID>.dkr.ecr.ap-south-1.amazonaws.com` | Authenticates local Docker client with AWS ECR using a temporary token. |
| `docker build -t capstone-app .` | Builds the local Docker image from the `Dockerfile`. |
| `docker tag capstone-app:latest <ACCOUNT_ID>.dkr.ecr.ap-south-1.amazonaws.com/capstone-app:latest` | Tags the local image with the full ECR registry URI. |
| `docker push <ACCOUNT_ID>.dkr.ecr.ap-south-1.amazonaws.com/capstone-app:latest` | Uploads the tagged container image to AWS ECR. |

## Deliverables
- AWS ECR console screenshot showing the uploaded image (`screenshots/`)
