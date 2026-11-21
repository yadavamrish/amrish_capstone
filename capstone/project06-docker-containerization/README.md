# Project 06: Application Containerization with Docker

## 1. Project Overview & Goal
Application code aur uski runtime dependencies ko ek lightweight, portable **Docker Container Image** mein package karna taaki woh har environment (local VM, CI runner, cloud server) mein identical behave kare.

## 2. Key Concepts Implemented
- Custom `Dockerfile` authoring (`FROM`, `COPY`, `EXPOSE`, `CMD`).
- Image versioning (`v1` / `latest`), detached container execution, aur port mapping.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Image Build:** `Dockerfile` se versioned Docker image build ki aur local image cache mein size/layers inspect kiye.
2. **Container Runtime & Port Mapping:** Container ko background (`-d`) mein launch karke host port `8080` ko container port `80` se bind kiya.
3. **Health & Log Inspection:** `docker ps`, `docker logs`, aur `curl` se application response verify kiya.

## 4. Commands Executed & Unka Kaam
1. `docker build -t amrish-capstone-web:v1 .`
   - **Kaam:** `Dockerfile` ke instructions execute karke reusable Docker image build karta hai.
2. `docker run -d -p 8080:80 --name capstone-app amrish-capstone-web:v1`
   - **Kaam:** Image se detached container start karta hai aur host port `8080` ko container port `80` par forward karta hai.
3. `docker ps && docker logs capstone-app`
   - **Kaam:** Running container status (`Up`) aur runtime logs inspect karta hai.
4. `curl -i http://localhost:8080`
   - **Kaam:** Containerized web server par HTTP `200 OK` response verify karta hai.

## 5. Expected Output / Verification
- `docker ps` mein container `Up` dikhta hai aur `http://localhost:8080` par `HTTP/1.1 200 OK` response milta hai.
