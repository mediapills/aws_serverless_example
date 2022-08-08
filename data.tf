data "aws_iam_policy_document" "lambda_allow_sts_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    sid     = ""
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "api_gateway_allow_sts_assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    sid     = ""
    principals {
      type        = "Service"
      identifiers = ["apigateway.amazonaws.com"]
    }
  }
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}
