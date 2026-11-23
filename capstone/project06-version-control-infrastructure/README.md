# Project 06: Application Containerization with Docker

## 1. Project Overview & Goal
The goal of this project is to package a web application and its runtime dependencies into a lightweight, portable **Docker Container Image** so that it runs consistently across any local, CI, or cloud environment.

## 2. Key Concepts Implemented
- Declarative `Dockerfile` authoring (`FROM`, `COPY`, `EXPOSE`, `CMD`).
- Image tagging/versioning, detached container execution, port forwarding, and runtime log inspection.

## 3. Step-by-Step Implementation
1. **Docker Image Build:** Built a versioned Docker image from a `Dockerfile` and verified image metadata locally.
2. **Container Runtime & Port Mapping:** Launched the container in detached mode (`-d`) mapping host port `8080` to container port `80`.
3. **Health & Log Inspection:** Verified container uptime via `docker ps`, inspected stdout logs via `docker logs`, and validated HTTP responses with `curl`.

## 4. Commands Executed & Purpose
1. `docker build -t amrish-capstone-web:v1 .`
   - **Purpose:** Builds a reusable Docker container image tagged `v1` from the local `Dockerfile`.
2. `docker run -d -p 8080:80 --name capstone-app amrish-capstone-web:v1`
   - **Purpose:** Runs the container in the background and maps host port `8080` to internal container port `80`.
3. `docker ps && docker logs capstone-app`
   - **Purpose:** Confirms the container is in the `Up` state and prints application runtime logs.
4. `curl -i http://localhost:8080`
   - **Purpose:** Sends an HTTP request to port `8080` to verify an `HTTP 200 OK` response from the containerized app.

## 5. Expected Output & Verification
- `docker ps` shows `capstone-app` running, and `curl -i http://localhost:8080` returns `HTTP/1.1 200 OK`.
