variable "aws_iam_policy_name_prefix" {
  type        = string
  description = "The prefix for name of the aws lambda role policy."
  default     = "ServerlessExamplePolicy"
}

variable "aws_iam_role_name_prefix" {
  type        = string
  description = "The aws lambda role name."
  default     = "ServerlessExampleRole"
}

variable "aws_lambda_function_name" {
  type        = string
  description = "The aws lambda function name."
  default     = "serverless_example_function"
}

variable "aws_api_gateway_rest_api_name" {
  type        = string
  description = "The aws api gateway name."
  default     = "serverless_example_api"
}

variable "aws_api_gateway_stage_name" {
  type        = string
  description = "The aws api gateway name."
  default     = "serverless_example_stage"
}

variable "aws_api_gateway_usage_plan" {
  type        = string
  description = "The aws api gateway usage plan name."
  default     = "serverless_example_plan"
}

variable "aws_api_gateway_api_key_name" {
  type        = string
  description = "The aws api key name."
  default     = "serverless_example_api_key"
}
