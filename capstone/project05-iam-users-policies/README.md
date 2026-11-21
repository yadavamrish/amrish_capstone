# Project 05: IAM Users & Policies

## Project Goal
AWS IAM mein least-privilege principle ke mutabik IAM Users, Groups, aur Custom/Managed IAM Policies configure karna taaki granular access control enforce ho sake.

## Kya & Kaise Kiya
1. **IAM User & Group Setup:** Dedicated IAM users aur developer/admin groups create kiye.
2. **Policy Attachment & Verification:** Read-only aur service-specific IAM policies attach karke `aws iam` CLI commands se permissions verify ki.

## Commands Used & Unka Kaam
1. `aws iam create-user --user-name amrish-dev-user`
   - **Kaam:** AWS account mein ek naya IAM user create karta hai.
2. `aws iam create-group --group-name devops-engineers && aws iam add-user-to-group --user-name amrish-dev-user --group-name devops-engineers`
   - **Kaam:** IAM group banakar user ko us group mein assign karta hai.
3. `aws iam attach-group-policy --group-name devops-engineers --policy-arn arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess`
   - **Kaam:** Group par least-privilege managed IAM policy attach karta hai.
4. `aws iam list-attached-group-policies --group-name devops-engineers --output table`
   - **Kaam:** Group par attached sabhi IAM policies ko CLI se verify karta hai.
