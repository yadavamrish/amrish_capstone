# Project 14: EKS App Deployment

## Project Goal
Kubernetes `Deployment` manifest (`deployment.yaml`) aur custom frontend (`index.html`) ke through Amazon EKS cluster par scalable web application pods deploy karna.

## Kya & Kaise Kiya
1. **Kubernetes Deployment Manifest (`deployment.yaml`):** Multiple pod replicas, container image, aur port `80` specifications define kiye.
2. **Cluster Rollout & Verification:** `kubectl apply -f deployment.yaml` run karke pods ke `Running` status aur rollout completion ko verify kiya.

## Commands Used & Unka Kaam
1. `aws eks update-kubeconfig --region ap-south-1 --name amrish-eks-cluster`
   - **Kaam:** `kubectl` CLI ko AWS EKS cluster se connect karta hai.
2. `kubectl apply -f capstone/project14-eks-app-deployment/deployment.yaml`
   - **Kaam:** EKS cluster mein application Deployment aur pod replicas create karta hai.
3. `kubectl get pods -o wide`
   - **Kaam:** Deployed pods ka `Running` status aur worker node assignment check karta hai.
4. `kubectl rollout status deployment/amrish-capstone-app`
   - **Kaam:** Verify karta hai ki deployment rollout bina kisi error ke complete ho gaya hai.
