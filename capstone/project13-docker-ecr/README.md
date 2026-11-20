# Project 13: Build Image and Push to Container Registry (ECR / Docker Hub)

## Steps Performed

1. **Created Sample Web Application & Dockerfile:**
   - Built a lightweight web application (`index.html` and `Dockerfile`) based on `nginx:alpine` and created the local Docker image (`amrish071/amrish-capstone-app:latest`).

2. **Container Registry Authentication & Image Push:**
   - Because `ecr:CreateRepository` and `ecr:DescribeRepositories` permissions are restricted in the AWS Training Sandbox IAM policy, created the `amrish-capstone-app` repository on Docker Hub (`hub.docker.com/u/amrish071`).
   - Authenticated via `docker login -u amrish071` using a Read & Write Personal Access Token, pushed `amrish071/amrish-capstone-app:latest`, and captured both the registry dashboard and AWS ECR IAM restriction screenshots.
