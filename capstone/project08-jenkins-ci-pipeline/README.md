# Project 08: Jenkins CI Pipeline & Container Build

## Project Goal
Automated CI pipeline ke through static web application (`index.html`) aur `Dockerfile` ko build aur validate karna.

## Kya & Kaise Kiya
1. **Containerized App Assets (`Dockerfile` & `index.html`):** Custom HTML page ko Nginx/Apache container image mein package karne ke liye `Dockerfile` aur `index.html` तैयार kiya.
2. **CI Build Verification:** Automated build steps (`docker build` / Jenkins pipeline stages) run karke build success verify kiya.

## Commands Used & Unka Kaam
1. `docker build -t amrish-p08-ci-web:latest capstone/project08-jenkins-ci-pipeline/`
   - **Kaam:** Project 08 ke `Dockerfile` aur `index.html` se Docker image build karta hai.
2. `docker run -d -p 8088:80 --name p08-ci-test amrish-p08-ci-web:latest`
   - **Kaam:** Built CI image ko test container ke roop mein launch karta hai.
3. `curl -i http://localhost:8088`
   - **Kaam:** CI build artifact ke live HTTP `200 OK` response ko verify karta hai.
