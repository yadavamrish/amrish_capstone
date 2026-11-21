# Project 07: Multi-Container Orchestration with Docker Compose

## Project Goal
Multiple interdependent services (Frontend/Backend Web App + Database/Cache) ko ek declarative `docker-compose.yml` file ke through ek hi command mein orchestrate, network, aur manage karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Declarative Stack Configuration (`docker-compose.yml`):** Web application service aur backend database/cache service ko custom bridge network, environment variables, aur persistent volumes ke saath configure kiya.
2. **Multi-Container Deployment:** `docker compose up` se sabhi services ek saath launch ki aur service-name based internal DNS communication test ki.
3. **Lifecycle & Volume Cleanup:** Stack health inspect karne ke baad clean shutdown aur resource cleanup verify kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `docker compose config`
   - **Kaam:** `docker-compose.yml` file ke YAML syntax aur environment variable substitutions ko validate karta hai.
2. `docker compose up -d --build`
   - **Kaam:** Sabhi defined services ki images build karke unhein isolated bridge network ke andar background (`-d`) mein ek saath start karta hai.
3. `docker compose ps`
   - **Kaam:** Compose project ke sabhi containers ki state (`Up`/`Healthy`) aur exposed ports dikhata hai.
4. `docker compose logs -f web`
   - **Kaam:** Specific service (`web`) ke real-time streaming logs terminal par follow (`-f`) karta hai.
5. `docker compose exec web sh`
   - **Kaam:** Running container ke andar interactive shell open karta hai taaki internal network connectivity (`ping db`) test ki ja sake.
6. `docker compose down -v`
   - **Kaam:** Stack ke sabhi containers, custom networks, aur attached volumes (`-v`) ko stop aur remove karta hai.
