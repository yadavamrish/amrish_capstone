# Project 07: Multi-Container Orchestration with Docker Compose

## 1. Project Overview & Goal
Multiple interdependent services (Frontend/Backend Web App + Database/Cache) ko ek declarative `docker-compose.yml` file ke zariye custom bridge network aur persistent volumes ke saath ek hi command mein orchestrate karna.

## 2. Key Concepts Implemented
- Multi-service YAML configuration (`services`, `networks`, `volumes`, `depends_on`).
- Internal DNS service discovery aur clean lifecycle management.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Compose Stack Configuration:** Web app aur database services ko isolated Docker network ke andar define kiya.
2. **Simultaneous Startup:** `docker compose up -d --build` run karke poore stack ko ek saath start kiya.
3. **Connectivity & Cleanup Check:** Container status verify karne ke baad `docker compose down -v` se clean teardown test kiya.

## 4. Commands Executed & Unka Kaam
1. `docker compose config`
   - **Kaam:** `docker-compose.yml` ke YAML syntax aur merged configuration ko validate karta hai.
2. `docker compose up -d --build`
   - **Kaam:** Sabhi services build karke isolated network mein background mein start karta hai.
3. `docker compose ps`
   - **Kaam:** Sabhi running compose services aur unke exposed ports ki state dikhata hai.
4. `docker compose down -v`
   - **Kaam:** Stack ke sabhi containers, custom networks, aur volumes ko safely remove karta hai.

## 5. Expected Output / Verification
- Sabhi defined services `Up` state mein aati hain aur container names ke through aapas mein communicate kar pati hain.
