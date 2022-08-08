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

variable "aws_lambda_function_name" {
  type        = string
  description = "The aws lambda function name."
  default     = "serverless_example"
}

variable "aws_api_gateway_rest_api_name" {
  type        = string
  description = "The aws api gateway name."
  default     = "serverless_example"
}
