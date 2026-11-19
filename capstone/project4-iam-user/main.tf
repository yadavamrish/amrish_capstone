resource "aws_iam_user" "s3_reader" {
  name = var.iam_user_name

  tags = {
    Owner   = "Amrish Yadav"
    Project = "Project4-IAM-Automation"
  }
}

resource "aws_iam_user_policy_attachment" "s3_read_attach" {
  user       = aws_iam_user.s3_reader.name
  policy_arn = var.s3_read_policy_arn
}
