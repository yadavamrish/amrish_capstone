# Project 05: S3 Static Website Hosting

## Project Goal
Bina kisi EC2 ya backend web server ko manage kiye Amazon S3 object storage par ek serverless, highly available static website host karna.

## Kya & Kaise Kiya (Detailed Summary)
1. **S3 Bucket Creation:** AWS Mumbai (`ap-south-1`) region mein globally unique naam ke saath ek naya S3 bucket banaya.
2. **Public Access & Bucket Policy Setup:** Bucket par public access block settings disable karke ek JSON Bucket Policy (`s3:GetObject`) lagayi taaki internet users website files read kar sakein.
3. **Static Website Hosting & Upload:** S3 bucket par static website hosting enable ki (`index.html`), local HTML/CSS files sync ki, aur S3 website endpoint URL par live site verify ki.

## Commands Used & Unka Kaam (Detailed Reference)

1. `aws s3api create-bucket --bucket amrish-p05-static-site-$ACCOUNT_ID --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1`
   - **Kaam:** AWS Mumbai (`ap-south-1`) region mein naya S3 bucket create karta hai (`LocationConstraint` non-us-east-1 regions ke liye mandatory hota hai).
2. `aws s3api delete-public-access-block --bucket amrish-p05-static-site-$ACCOUNT_ID`
   - **Kaam:** S3 bucket par default "Block all public access" shield ko hatata hai taaki public website policy apply ho sake.
3. `aws s3api put-bucket-policy --bucket amrish-p05-static-site-$ACCOUNT_ID --policy file://bucket-policy.json`
   - **Kaam:** JSON policy apply karke sabhi anonymous web visitors (`Principal: "*"`) ko bucket objects read (`s3:GetObject`) karne ki permission deta hai.
4. `aws s3 website s3://amrish-p05-static-site-$ACCOUNT_ID/ --index-document index.html --error-document error.html`
   - **Kaam:** S3 bucket ko web server ki tarah behave karne ke liye static website hosting enable karta hai aur default index/error pages set karta hai.
5. `aws s3 sync ./website s3://amrish-p05-static-site-$ACCOUNT_ID/`
   - **Kaam:** Local `./website` directory ki sabhi HTML, CSS, aur image files ko S3 bucket mein upload aur synchronize karta hai.
6. `curl -i http://amrish-p05-static-site-$ACCOUNT_ID.s3-website.ap-south-1.amazonaws.com`
   - **Kaam:** S3 static website endpoint URL par HTTP request bhej kar `200 OK` status aur live HTML page verify karta hai.
