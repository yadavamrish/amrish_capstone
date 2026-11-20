# Project 14: App Deployment using Kubernetes (EKS / K3s)

## Steps Performed

1. **Docker Image & Kubernetes Manifest Setup:**
   - Built and pushed `amrish071/amrish-capstone-k8s:latest` and configured `capstone/project14-eks-k8s/deployment.yaml` with a 2-replica Kubernetes `Deployment` and a public `LoadBalancer` / `NodePort` (`30080`) `Service`.

2. **Deployment & Public Access Verification:**
   - Applied the Kubernetes manifests (`kubectl apply -f deployment.yaml`), verified running pods (`kubectl get pods,svc`), and accessed the live application at `http://localhost:30080` to capture the public access deliverable screenshot.
