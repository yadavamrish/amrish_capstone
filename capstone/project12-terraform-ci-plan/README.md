# Project 12: Private Container Registry (Amazon ECR)

## Project Goal
Built Docker container images ko securely store, version, aur scan karne ke liye AWS Mumbai (`ap-south-1`) mein ek private Amazon Elastic Container Registry (ECR) setup karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Private ECR Repository Creation:** `aws ecr create-repository` ke through `ap-south-1` mein `amrish-capstone` repository banayi aur image scanning enable ki.
2. **Docker Registry Authentication:** Temporary IAM authorization token fetch karke local Docker daemon ko Amazon ECR endpoint se login karaya.
3. **Image Tagging & Push:** Local Docker image ko full ECR URI ke saath tag kiya aur `docker push` se AWS cloud registry mein upload karke verify kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `aws ecr create-repository --repository-name amrish-capstone --image-scanning-configuration scanOnPush=true --region ap-south-1`
   - **Kaam:** Mumbai (`ap-south-1`) region mein private ECR repository banata hai aur har image push par automatic vulnerability scanning enable karta hai.
2. `aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com`
   - **Kaam:** AWS IAM se temporary authentication token lekar local Docker CLI ko Amazon ECR registry mein login karata hai.
3. `docker tag amrish-capstone-app:v1 $ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/amrish-capstone:latest`
   - **Kaam:** Local Docker image ko target Amazon ECR repository URI aur `latest` tag ke saath map karta hai.
4. `docker push $ACCOUNT_ID.dkr.ecr.ap-south-1.amazonaws.com/amrish-capstone:latest`
   - **Kaam:** Tagged Docker image layers ko Amazon ECR private registry mein upload karta hai.
5. `aws ecr list-images --repository-name amrish-capstone --region ap-south-1 --output table`
   - **Kaam:** ECR repository mein successfully uploaded images ke tags aur SHA256 digests verify karta hai.
