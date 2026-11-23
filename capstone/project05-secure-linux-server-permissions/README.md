# Project 05: AWS IAM Users, Groups & Least-Privilege Policies

## 1. Project Overview & Goal
The goal of this project is to enforce AWS security best practices by eliminating root account usage and configuring **IAM Users**, **IAM Groups**, and **Least-Privilege IAM Policies** for granular access control.

## 2. Key Concepts Implemented
- Non-root IAM user creation (`amrish-dev-user`) and group-based permission management (`devops-engineers`).
- Attaching scoped AWS Managed Policies following the principle of least privilege.

## 3. Step-by-Step Implementation
1. **IAM User & Group Provisioning:** Created a dedicated IAM user and an engineering IAM group via AWS CLI, then added the user to the group.
2. **Policy Assignment:** Attached read-only service policies (`AmazonEC2ReadOnlyAccess`) at the group level for scalable governance.
3. **Access Audit:** Verified group memberships and attached policy ARNs using IAM CLI inspection commands.

## 4. Commands Executed & Purpose
1. `aws iam create-user --user-name amrish-dev-user`
   - **Purpose:** Creates a dedicated non-root IAM user in AWS.
2. `aws iam create-group --group-name devops-engineers && aws iam add-user-to-group --user-name amrish-dev-user --group-name devops-engineers`
   - **Purpose:** Creates an IAM group and assigns the user to that group.
3. `aws iam attach-group-policy --group-name devops-engineers --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess`
   - **Purpose:** Grants least-privilege EC2 read-only permissions to all members of the group.
4. `aws iam list-attached-group-policies --group-name devops-engineers --output table`
   - **Purpose:** Audits and confirms all IAM policies currently attached to the group.

## 5. Expected Output & Verification
- `list-attached-group-policies` confirms the exact policy ARN attached to `devops-engineers`, restricting the user strictly to authorized read operations.
