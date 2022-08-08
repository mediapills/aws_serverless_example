resource "aws_lambda_function" "main" {
  function_name = var.aws_lambda_function_name

  role = aws_iam_role.lambda_role.arn

  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename         = "lambda_function_payload.zip"
  handler          = "lambda_function.lambda_handler"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")

  runtime = "python3.9"

  depends_on = [aws_iam_role.lambda_role]

  tags = local.tags
}

resource "aws_lambda_permission" "main" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.main.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.main.id}/*/*/*"

  depends_on = [aws_lambda_function.main, aws_api_gateway_rest_api.main]
}
