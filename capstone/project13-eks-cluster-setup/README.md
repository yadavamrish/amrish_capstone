# Project 13: Amazon EKS Cluster Provisioning

## Project Goal
Containerized workloads ko production scale par orchestrate karne ke liye AWS Mumbai (`ap-south-1`) mein ek managed Kubernetes cluster (Amazon EKS) aur worker node group provision karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **EKS Cluster & Node Group Creation:** `eksctl` CLI ke through managed Kubernetes control plane aur EC2 worker nodes (`t3.medium`) provision kiye.
2. **Kubeconfig Context Setup:** `aws eks update-kubeconfig` run karke local `kubectl` CLI ko EKS API server endpoint se authenticate kiya.
3. **Cluster Health Verification:** `kubectl get nodes` aur `kubectl get ns` se verify kiya ki sabhi worker nodes `Ready` state mein hain.

## Commands Used & Unka Kaam (Detailed Reference)

1. `eksctl create cluster --name amrish-eks-cluster --region ap-south-1 --nodegroup-name standard-workers --node-type t3.medium --nodes 2 --managed`
   - **Kaam:** AWS par managed EKS Kubernetes control plane, VPC networking, aur 2 EC2 worker nodes ek saath provision karta hai.
2. `aws eks update-kubeconfig --region ap-south-1 --name amrish-eks-cluster`
   - **Kaam:** Local `~/.kube/config` file mein EKS cluster credentials aur API endpoint add karta hai taaki `kubectl` commands cluster se baat kar sakein.
3. `kubectl cluster-info`
   - **Kaam:** Kubernetes control plane aur CoreDNS services ke running endpoints verify karta hai.
4. `kubectl get nodes -o wide`
   - **Kaam:** Cluster ke sabhi EC2 worker nodes ka `Ready` status, Kubernetes version, aur internal/external IPs dikhata hai.
