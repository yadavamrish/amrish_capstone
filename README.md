# AWS & DevOps Capstone Portfolio (Projects 1 – 24)
**Engineer:** Amrish Yadav (`yadavamrish` / `amrish071`) | **Cloud Region:** AWS Mumbai (`ap-south-1`)

## Complete Project Index (1 to 24) & Command Reference Guides

| # | Project Title | Core Goal | Key Tools & AWS Services | Guide |
| :--- | :--- | :--- | :--- | :--- |
| **01** | Linux Administration & Git Basics | Server CLI mastery, permissions, & version control | Linux Bash, `chmod`, Git, GitHub | [README](capstone/project01-linux-git-basics/README.md) |
| **02** | AWS IAM & CLI Configuration | Programmatic AWS access & least-privilege users | AWS IAM, AWS CLI (`aws configure`) | [README](capstone/project02-aws-iam-cli-setup/README.md) |
| **03** | EC2 Web Server Provisioning | Launch & configure Linux cloud compute instances | AWS EC2, Security Groups, Nginx | [README](capstone/project03-ec2-web-server/README.md) |
| **04** | Custom VPC & Subnet Networking | Isolated cloud network with public/private routing | AWS VPC, Subnets, Internet Gateway, Route Tables | [README](capstone/project04-vpc-networking/README.md) |
| **05** | S3 Static Website Hosting | Host serverless static web assets on object storage | Amazon S3, Bucket Policies | [README](capstone/project05-s3-static-hosting/README.md) |
| **06** | Application Containerization | Package apps into portable container images | Docker, `Dockerfile`, Docker CLI | [README](capstone/project06-docker-containerization/README.md) |
| **07** | Multi-Container Orchestration | Run multi-tier app + database stacks together | Docker Compose (`docker-compose.yml`) | [README](capstone/project07-docker-compose-multicontainer/README.md) |
| **08** | Automated CI Pipeline | Automate code build & test checks on every push | Jenkins, `Jenkinsfile`, `systemd` | [README](capstone/project08-jenkins-ci-pipeline/README.md) |
| **09** | Infrastructure as Code (IaC) | Provision repeatable AWS infrastructure declaratively | Terraform (`init`, `plan`, `apply`, `destroy`) | [README](capstone/project09-terraform-iac/README.md) |
| **10** | Custom DNS & Domain Routing | Map domain names to cloud endpoints | Amazon Route 53, Hosted Zones, `dig` | [README](capstone/project10-route53-dns/README.md) |
| **11** | GitHub Actions CI Workflow | Cloud-native CI linting, testing, & image builds | GitHub Actions (`.github/workflows/ci.yml`) | [README](capstone/project11-github-actions-ci/README.md) |
| **12** | Private Container Registry | Store & version Docker images securely in AWS | Amazon ECR, `docker push` | [README](capstone/project12-ecr-container-registry/README.md) |
| **13** | Amazon EKS Cluster Provisioning | Set up managed Kubernetes control plane & worker nodes | Amazon EKS, `eksctl`, `kubectl` | [README](capstone/project13-eks-cluster-setup/README.md) |
| **14** | Kubernetes Workload Deployment | Deploy & expose scalable pods on EKS | Kubernetes Deployments, Services (`LoadBalancer`) | [README](capstone/project14-eks-app-deployment/README.md) |
| **15** | EC2-Based Ansible Automation | Agentless configuration management across EC2 nodes | Ansible, `inventory.ini`, YAML Playbooks | [README](capstone/project15-ansible-ec2/README.md) |
| **16** | Enable HTTPS via ACM & ALB | Enforce TLS encryption (443) & block HTTP (80) | OpenSSL, AWS ACM, Application Load Balancer | [README](capstone/project16-https-acm/README.md) |
| **17** | Central Log Forwarding | Stream Linux app & system logs to AWS in real time | Amazon CloudWatch Agent, CloudWatch Logs | [README](capstone/project17-cloudwatch-logs/README.md) |
| **18** | Proactive Metric Alerting | Trigger automated alerts on high CPU/error thresholds | Amazon CloudWatch Alarms, SNS | [README](capstone/project18-cloudwatch-alarms/README.md) |
| **19** | Automated S3 Cron Backups | Scheduled daily compressed backups to S3 | Linux `cron`, `tar`, AWS S3 | [README](capstone/project19-s3-cron-backup/README.md) |
| **20** | Load Balanced App Deployment | Multi-AZ traffic distribution with health checks | 2x EC2 (Nginx), Target Group (`/health`), ALB | [README](capstone/project20-load-balanced-app/README.md) |
| **21** | CloudWatch Monitoring Dashboard | Real-time visualization of EC2, ALB & Log metrics | Amazon CloudWatch Dashboards | [README](capstone/project21-cloudwatch-dashboard/README.md) |
| **22** | S3 Log Archive with Lifecycle | Lower storage costs via Glacier tiering & expiration | Amazon S3 Lifecycle Rules (`GLACIER` & Expiration) | [README](capstone/project22-s3-log-lifecycle/README.md) |
| **23** | IAM Role Based Access | Credential-free S3 access from EC2 via IAM Roles | AWS IAM Roles, Instance Profiles, EC2 | [README](capstone/project23-iam-role-ec2/README.md) |
| **24** | Manual Chaos Test | Simulate service outage, recover, & log incident report | `systemd` (`systemctl`), `curl`, Incident Runbook | [README](capstone/project24-manual-chaos-test/README.md) |
