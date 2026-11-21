# Project 06: Docker Containerization

## Project Goal
Web application ko ek portable Docker container image mein package karna aur host port mapping ke saath run karke verify karna.

## Kya & Kaise Kiya
1. **Docker Image Build:** `Dockerfile` ke through lightweight container image build ki.
2. **Container Run & Inspection:** Detached mode (`-d`) mein container run karke `docker ps`, `docker logs`, aur `curl` se response test kiya.

## Commands Used & Unka Kaam
1. `docker build -t amrish-capstone-web:v1 .`
   - **Kaam:** `Dockerfile` se portable Docker container image build karta hai.
2. `docker run -d -p 8080:80 --name capstone-app amrish-capstone-web:v1`
   - **Kaam:** Container ko background mein run karke host port `8080` ko container port `80` se map karta hai.
3. `docker ps && docker logs capstone-app`
   - **Kaam:** Running container status aur application logs verify karta hai.
4. `curl -i http://localhost:8080`
   - **Kaam:** Localhost port `8080` par HTTP `200 OK` response verify karta hai.
