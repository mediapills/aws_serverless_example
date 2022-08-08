resource "aws_lambda_function" "main" {
  function_name = var.aws_lambda_function_name

  role = aws_iam_role.main.arn

  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename         = "lambda_function_payload.zip"
  handler          = "lambda_function.lambda_handler"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.9"

  depends_on = [aws_iam_role.main]

  tags = local.tags
}
