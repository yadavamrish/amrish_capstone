# Project 05: AWS IAM Users, Groups & Least-Privilege Policies

## 1. Project Overview & Goal
AWS account security ko strong banane ke liye root account use karne ke bajay **Least-Privilege Principle** ke mutabik IAM Users, IAM Groups, aur specific Managed/Inline Policies configure karna.

## 2. What Was Configured
- Dedicated developer/operations IAM user (`amrish-dev-user`) aur IAM group (`devops-engineers`).
- Granular read/write permissions via AWS IAM Policies.

## 3. Step-by-Step Implementation (Kya & Kaise Kiya)
1. **User & Group Creation:** AWS CLI ke through naya IAM user aur team group banaya aur user ko group mein add kiya.
2. **Policy Attachment:** Group par sirf zaroori permissions (e.g., `AmazonEC2ReadOnlyAccess` / `AmazonS3ReadOnlyAccess`) attach ki.
3. **Permission Audit:** Attached policies aur user memberships ko CLI se audit karke verify kiya.

## 4. Commands Executed & Unka Kaam
1. `aws iam create-user --user-name amrish-dev-user`
   - **Kaam:** AWS IAM mein ek naya non-root user create karta hai.
2. `aws iam create-group --group-name devops-engineers && aws iam add-user-to-group --user-name amrish-dev-user --group-name devops-engineers`
   - **Kaam:** IAM group create karke user ko group membership assign karta hai.
3. `aws iam attach-group-policy --group-name devops-engineers --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess`
   - **Kaam:** Group par least-privilege managed IAM policy attach karta hai.
4. `aws iam list-attached-group-policies --group-name devops-engineers --output table`
   - **Kaam:** Group par active sabhi IAM policies ki table print karke verify karta hai.

## 5. Expected Output / Verification
- `list-attached-group-policies` output mein exact policy ARN aur name confirm hota hai, aur user sirf allowed AWS actions hi perform kar pata hai.
