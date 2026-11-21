# Project 14: Kubernetes Workload Deployment on EKS

## Project Goal
Containerized web application ko Amazon EKS cluster par high-availability replicas ke saath deploy karna aur Kubernetes `LoadBalancer` Service ke through public internet par expose karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **Kubernetes Manifests Authoring (`deployment.yaml` & `service.yaml`):** 2+ pod replicas, container image URI, resource limits, aur `type: LoadBalancer` service define ki.
2. **Manifest Deployment & Rollout Check:** `kubectl apply` se resources EKS par deploy kiye aur `kubectl rollout status` se zero-downtime deployment verify kiya.
3. **External Endpoint Verification:** Provisioned AWS Classic/Network Load Balancer external hostname par HTTP request bhej kar live response test kiya.

## Commands Used & Unka Kaam (Detailed Reference)

1. `kubectl apply -f deployment.yaml -f service.yaml`
   - **Kaam:** EKS cluster mein Kubernetes `Deployment` (multiple pod replicas) aur external `LoadBalancer` Service create/update karta hai.
2. `kubectl rollout status deployment/amrish-capstone-web`
   - **Kaam:** Real time mein monitor karta hai ki sabhi updated pods successfully schedule aur running state mein aa gaye hain ya nahi.
3. `kubectl get pods,svc -o wide`
   - **Kaam:** Running pods ke IP addresses aur LoadBalancer Service ka public `EXTERNAL-IP` (AWS ELB DNS) print karta hai.
4. `curl -i http://<EXTERNAL-ELB-DNS>`
   - **Kaam:** Kubernetes LoadBalancer endpoint par HTTP request bhej kar live containerized app response verify karta hai.
