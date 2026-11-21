# Project 08: CI Pipeline & Containerized Web Application Build

## 1. Project Overview & Goal
Automated Continuous Integration (CI) pipeline ke zariye web application (`index.html`) aur `Dockerfile` ko build, package, aur test karna taaki har code change automatically verify ho sake.

## 2. Files in This Folder
- `Dockerfile` — Web server base image ke andar `index.html` copy karke container image banane ki instructions.
- `index.html` — CI pipeline ke through build aur verify hone wala HTML webpage.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Application & Dockerfile Setup:** `index.html` aur `Dockerfile` ko clean build context mein organize kiya.
2. **Automated Build & Container Test:** CI stages (`Checkout -> Build Image -> Run Smoke Test`) execute karke image build aur HTTP response verify kiya.

## 4. Commands Executed & Unka Kaam
1. `docker build -t amrish-p08-ci-web:latest capstone/project08-jenkins-ci-pipeline/`
   - **Kaam:** Folder ke `Dockerfile` aur `index.html` se Docker image build karta hai.
2. `docker run -d -p 8088:80 --name p08-ci-test amrish-p08-ci-web:latest`
   - **Kaam:** Built image ko temporary test container ke roop mein start karta hai.
3. `curl -i http://localhost:8088`
   - **Kaam:** Smoke test ke roop mein HTTP `200 OK` aur `index.html` content verify karta hai.

## 5. Expected Output / Verification
- CI build bina error ke complete hota hai aur smoke test container `HTTP/1.1 200 OK` return karta hai.
