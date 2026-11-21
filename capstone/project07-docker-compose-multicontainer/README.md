# Project 07: Docker Compose Multi-Container

## Project Goal
Multi-container application stack ko `docker-compose.yml` ke through isolated bridge network aur persistent volumes ke saath ek command mein orchestrate karna.

## Kya & Kaise Kiya
1. **Compose Service Definition:** Web frontend/backend aur database/cache services ko `docker-compose.yml` mein configure kiya.
2. **Stack Execution & Verification:** `docker compose up -d` run karke sabhi containers ki health aur inter-service communication test ki.

## Commands Used & Unka Kaam
1. `docker compose config`
   - **Kaam:** `docker-compose.yml` ke YAML syntax aur service configuration ko validate karta hai.
2. `docker compose up -d --build`
   - **Kaam:** Sabhi services ko build karke ek saath background mein start karta hai.
3. `docker compose ps`
   - **Kaam:** Sabhi running containers aur unke mapped ports ki state dikhata hai.
4. `docker compose down -v`
   - **Kaam:** Stack ke containers, networks, aur volumes ko clean tareeke se stop aur remove karta hai.
