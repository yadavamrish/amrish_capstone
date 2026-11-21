# Project 06: Application Containerization with Docker

## Project Goal
Application code aur uski sabhi runtime dependencies ko ek lightweight, portable Docker container image mein package karna taaki woh har environment mein bina dependency conflict ke identical chale.

## Kya & Kaise Kiya (Detailed Summary)
1. **Dockerfile Authoring:** Base image (`nginx:alpine` / `node:alpine`), working directory, application files copy (`COPY`), port exposure (`EXPOSE 80`), aur startup instructions define kiye.
2. **Docker Image Build:** `docker build` ke through versioned container image banayi aur local image registry mein verify ki.
3. **Container Execution & Testing:** Container ko detached mode (`-d`) mein port mapping ke saath run karke `curl` aur `docker logs` se live response verify kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `docker build -t amrish-capstone-app:v1 .`
   - **Kaam:** Current directory mein maujood `Dockerfile` ke instructions padh kar `amrish-capstone-app:v1` naam ki reusable Docker image build karta hai.
2. `docker images`
   - **Kaam:** Local machine par stored sabhi Docker images, unke tags, Image IDs, aur disk size ki list dikhata hai.
3. `docker run -d -p 8080:80 --name capstone-web amrish-capstone-app:v1`
   - **Kaam:** Image se ek live container background (`-d`) mein start karta hai aur host machine ke port `8080` ko container ke internal port `80` se map karta hai.
4. `docker ps`
   - **Kaam:** Abhi currently chal rahe sabhi active containers ka status, uptime, aur port bindings dikhata hai.
5. `docker logs capstone-web`
   - **Kaam:** Container ke andar chal rahi application ke standard output (`stdout`) aur error logs (`stderr`) print karta hai.
6. `curl -i http://localhost:8080`
   - **Kaam:** Localhost port `8080` par HTTP request bhej kar containerized web server se `200 OK` response verify karta hai.
7. `docker stop capstone-web && docker rm capstone-web`
   - **Kaam:** Running container ko gracefully stop karta hai aur uske container instance ko clean karta hai.
