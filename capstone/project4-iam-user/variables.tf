variable "iam_user_name" {
  description = "Name of the IAM user to create"
  type        = string
  default     = "amrish-s3-readonly-user"
}

variable "s3_read_policy_arn" {
  description = "IAM Policy ARN for S3 Read-Only access"
  type        = string
  default     = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
