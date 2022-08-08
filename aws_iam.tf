resource "aws_iam_role" "apigateway_role" {
  name = join("", [var.aws_iam_role_name_prefix, "4APIGateway"])

  assume_role_policy = data.aws_iam_policy_document.api_gateway_allow_sts_assume_role.json
  managed_policy_arns = [
    aws_iam_policy.api_gw_allow_lambda_actions.arn
  ]
}

resource "aws_iam_policy" "api_gw_allow_lambda_actions" {
  name = join("", [var.aws_iam_policy_name_prefix, "APIGatewayAllowLambdaActions"])

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "lambda:*"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })

  tags = local.tags
}

resource "aws_iam_role" "lambda_role" {
  name               = join("", [var.aws_iam_role_name_prefix, "4Lambda"])
  assume_role_policy = data.aws_iam_policy_document.lambda_allow_sts_assume_role.json
  managed_policy_arns = [
    aws_iam_policy.lambda_function_allow_logs_actions.arn,
  ]

  tags = local.tags
}

resource "aws_iam_policy" "lambda_function_allow_logs_actions" {
  name = join("", [var.aws_iam_policy_name_prefix, "LambdaAllowCloudWatchActions"])

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:CreateLogGroup",
          "logs:PutLogEvents",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })

  tags = local.tags
}

