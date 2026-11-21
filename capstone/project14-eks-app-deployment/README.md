# Project 14: Scalable Kubernetes Workload Deployment on Amazon EKS

## 1. Project Overview & Goal
The goal of this project is to deploy a scalable, self-healing containerized web application (`deployment.yaml` and `index.html`) onto an **Amazon Elastic Kubernetes Service (EKS)** cluster and verify pod rollout health.

## 2. Files in This Folder
- `deployment.yaml` — Kubernetes `Deployment` manifest defining replica count, container image, labels, and container port `80`.
- `index.html` — Web frontend served by the deployed Kubernetes pods.

## 3. Step-by-Step Implementation
1. **Kubeconfig Authentication:** Configured `kubectl` to connect to the `ap-south-1` Amazon EKS cluster.
2. **Deployment Rollout:** Applied `deployment.yaml` to schedule pod replicas across EKS worker nodes.
3. **Pod & Rollout Verification:** Verified `Running` pod statuses and zero-downtime rollout completion via `kubectl`.

## 4. Commands Executed & Purpose
1. `aws eks update-kubeconfig --region ap-south-1 --name amrish-eks-cluster`
   - **Purpose:** Updates `~/.kube/config` with EKS cluster credentials so `kubectl` can communicate with the Kubernetes API server.
2. `kubectl apply -f capstone/project14-eks-app-deployment/deployment.yaml`
   - **Purpose:** Creates or updates the Kubernetes `Deployment` and schedules application pods.
3. `kubectl get pods -o wide`
   - **Purpose:** Lists all running pods, their internal IPs, and assigned worker nodes.
4. `kubectl rollout status deployment/amrish-capstone-app`
   - **Purpose:** Monitors and confirms successful rollout completion across all replicas.

## 5. Expected Output & Verification
- `kubectl get pods` shows all replicas in `1/1 Running` state, and `kubectl rollout status` confirms `successfully rolled out`.
