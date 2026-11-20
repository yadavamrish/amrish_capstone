# Project 13: Build Image and Push to ECR

## Steps Performed

1. **Built Docker Image:**
   - Created a lightweight Nginx web application (`index.html` and `Dockerfile`) and built the Docker image (`amrish-capstone-app:latest`).

2. **Created Amazon ECR Repository & Pushed Image:**
   - Created private Amazon ECR repository `amrish-capstone-app` in `ap-south-1` (`590507089733.dkr.ecr.ap-south-1.amazonaws.com/amrish-capstone-app`) via AWS CLI.
   - Authenticated Docker CLI using `aws ecr get-login-password`, tagged the image with the ECR URI, and pushed `latest` (`sha256:055ee27fd9b2d5297ba19f5135da5552df8f4a8abdf332f89f4396d3156e8e2b`) to Amazon ECR.
