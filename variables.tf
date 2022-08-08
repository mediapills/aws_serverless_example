variable "aws_iam_policy_name_prefix" {
  type        = string
  description = "The prefix for name of the aws lambda role policy."
  default     = "ServerlessExample"
}

variable "aws_iam_role_name" {
  type        = string
  description = "The aws lambda role name."
  default     = "ServerlessExample"
}
