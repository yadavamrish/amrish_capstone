# Project 8: Container Deployment with Docker

## Goal
Containerize a web application using a `Dockerfile` and run it locally in a Docker container.

## Steps Performed
1. Created a `Dockerfile` based on `nginx:alpine` (or lightweight web image) copying custom HTML/app files into the container.
2. Built the Docker image locally using `docker build`.
3. Ran the container in detached mode mapping host port `8085` to container port `80`.
4. Verified container status and accessed the containerized app locally.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `docker build -t capstone-web:v1 .` | Builds a Docker image tagged `capstone-web:v1` from the local `Dockerfile`. |
| `docker images` | Lists locally built Docker images and verifies image size/tag. |
| `docker run -d --name web-container -p 8085:80 capstone-web:v1` | Starts the container in background (`-d`) and maps port `8085` to `80`. |
| `docker ps` | Verifies that the container is actively running (`Up`). |
| `curl http://localhost:8085` | Tests the live web application running inside the Docker container. |

## Deliverables
- `Dockerfile` and application files
- Screenshot of running container and webpage output (`screenshots/`)
