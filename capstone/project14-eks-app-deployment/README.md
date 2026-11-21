# Project 14: Scalable Kubernetes Workload Deployment on Amazon EKS

## 1. Project Overview & Goal
Kubernetes declarative manifest (`deployment.yaml`) aur web frontend (`index.html`) ke zariye **Amazon Elastic Kubernetes Service (EKS)** cluster par multiple pod replicas deploy karna aur zero-downtime rollout verify karna.

## 2. Files in This Folder
- `deployment.yaml` — Kubernetes `Deployment` manifest jo pod replicas, container image, labels, aur container port `80` define karta hai.
- `index.html` — Deployed web workload ka HTML page.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **Kubeconfig Setup:** `aws eks update-kubeconfig` se local `kubectl` CLI ko `ap-south-1` EKS cluster se authenticate kiya.
2. **Deployment Rollout:** `kubectl apply -f deployment.yaml` run karke pods schedule kiye.
3. **Pod & Rollout Verification:** `kubectl get pods` aur `kubectl rollout status` se verify kiya ki sabhi replicas `Running` state mein hain.

## 4. Commands Executed & Unka Kaam
1. `aws eks update-kubeconfig --region ap-south-1 --name amrish-eks-cluster`
   - **Kaam:** `kubectl` CLI ko AWS EKS Kubernetes API server se connect karta hai.
2. `kubectl apply -f capstone/project14-eks-app-deployment/deployment.yaml`
   - **Kaam:** EKS cluster mein Kubernetes Deployment aur pod replicas create karta hai.
3. `kubectl get pods -o wide`
   - **Kaam:** Sabhi deployed pods ka `Running` status, pod IPs, aur worker nodes dikhata hai.
4. `kubectl rollout status deployment/amrish-capstone-app`
   - **Kaam:** Deployment rollout cleanly complete hua ya nahi, verify karta hai.

## 5. Expected Output / Verification
- Sabhi pods `1/1 Running` state mein dikhte hain aur `kubectl rollout status` `successfully rolled out` message return karta hai.
