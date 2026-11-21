# Project 08: CI Pipeline & Containerized Web Application Build

## 1. Project Overview & Goal
The goal of this project is to automate the build and validation of a containerized web application (`Dockerfile` and `index.html`) through a Continuous Integration (CI) workflow so every code update is automatically packaged and smoke-tested.

## 2. Files in This Folder
- `Dockerfile` — Instructions to package `index.html` into a lightweight web server container image.
- `index.html` — HTML webpage built and verified during the CI pipeline execution.

## 3. Step-by-Step Implementation
1. **Build Context Preparation:** Organized `Dockerfile` and `index.html` for repeatable container builds.
2. **CI Build & Smoke Test:** Executed automated build steps (`Checkout -> Build Image -> Run Smoke Test`) to verify image creation and HTTP availability.

## 4. Commands Executed & Purpose
1. `docker build -t amrish-p08-ci-web:latest capstone/project08-jenkins-ci-pipeline/`
   - **Purpose:** Builds the Docker image from `Dockerfile` and `index.html`.
2. `docker run -d -p 8088:80 --name p08-ci-test amrish-p08-ci-web:latest`
   - **Purpose:** Starts a temporary container from the newly built CI image for automated verification.
3. `curl -i http://localhost:8088`
   - **Purpose:** Executes a smoke test confirming `HTTP 200 OK` and proper rendering of `index.html`.

## 5. Expected Output & Verification
- The CI build completes with zero errors and the smoke test container responds with `HTTP/1.1 200 OK`.
