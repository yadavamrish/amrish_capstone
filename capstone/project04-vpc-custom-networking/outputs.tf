output "iam_user_name" {
  value = aws_iam_user.s3_reader.name
}

output "iam_user_arn" {
  value = aws_iam_user.s3_reader.arn
}

output "attached_policy_arn" {
  value = aws_iam_user_policy_attachment.s3_read_attach.policy_arn
}
