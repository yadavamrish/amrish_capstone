# Project 07: Multi-Container Orchestration with Docker Compose

## 1. Project Overview & Goal
The goal of this project is to orchestrate a multi-service application stack (Web Application + Backend Database/Cache) using a declarative `docker-compose.yml` file with isolated bridge networking and persistent storage volumes.

## 2. Key Concepts Implemented
- Multi-container service definitions (`services`, `networks`, `volumes`, `depends_on`).
- Internal DNS service discovery and single-command lifecycle management.

## 3. Step-by-Step Implementation
1. **Compose Stack Configuration:** Defined interdependent services, environment variables, and custom networks in `docker-compose.yml`.
2. **Multi-Container Startup:** Built and launched all services simultaneously in detached mode.
3. **Stack Inspection & Cleanup:** Verified container health and inter-service connectivity before performing a clean teardown.

## 4. Commands Executed & Purpose
1. `docker compose config`
   - **Purpose:** Validates YAML syntax and variable interpolation inside `docker-compose.yml`.
2. `docker compose up -d --build`
   - **Purpose:** Builds service images and starts all containers within an isolated bridge network.
3. `docker compose ps`
   - **Purpose:** Displays the running status and port mappings of all Compose-managed containers.
4. `docker compose down -v`
   - **Purpose:** Stops and removes all stack containers, networks, and attached volumes.

## 5. Expected Output & Verification
- All defined services reach `Up` status and communicate seamlessly over internal Docker DNS service names.
