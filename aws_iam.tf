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

resource "aws_iam_role" "lambda" {
  name               = var.aws_iam_role_name
  assume_role_policy = data.aws_iam_policy_document.lambda_allow_sts_assume_role.json
  managed_policy_arns = [
    aws_iam_policy.lambda_function_allow_logs_actions.arn,
  ]

  tags = {} # TODO
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

  tags = {} # TODO
}

