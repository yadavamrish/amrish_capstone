# Project 14: App Deployment using EKS

## Goal
Provision an Amazon EKS Kubernetes cluster, deploy a containerized web application, and expose it publicly.

## Steps Performed
1. Provisioned an Amazon EKS cluster and managed worker node group using `eksctl` / Terraform.
2. Updated local `kubeconfig` to connect `kubectl` to the EKS cluster.
3. Applied Kubernetes `Deployment` and `Service` (`type: LoadBalancer`) manifests.
4. Verified pod status and accessed the application via the AWS LoadBalancer external DNS.

## Commands Used & Their Purpose
| Command | Purpose |
| :--- | :--- |
| `aws eks update-kubeconfig --region ap-south-1 --name capstone-eks` | Configures `kubectl` credentials to communicate with the EKS cluster. |
| `kubectl apply -f deployment.yaml` | Deploys application pods and replica sets onto EKS worker nodes. |
| `kubectl apply -f service.yaml` | Creates a `LoadBalancer` service to expose the pods publicly. |
| `kubectl get pods,svc` | Checks running pod status and retrieves the external `EXTERNAL-IP` URL. |

## Deliverables
- Kubernetes manifests (`deployment.yaml`, `service.yaml`)
- Screenshot of public application access via LoadBalancer URL (`screenshots/`)
