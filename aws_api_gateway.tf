resource "aws_api_gateway_rest_api" "main" {
  name = var.aws_api_gateway_rest_api_name

  body = templatefile("${path.module}/swagger.json", {
    lambda_uri = local.lambda_function_uri,
  })

  endpoint_configuration {
    types = ["REGIONAL"] // could be PRIVATE, EDGE or REGIONAL
  }

  depends_on = [aws_lambda_function.main]

  tags = local.tags
}

resource "aws_api_gateway_deployment" "main" {
  rest_api_id = aws_api_gateway_rest_api.main.id

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "main" {
  deployment_id = aws_api_gateway_deployment.main.id
  rest_api_id   = aws_api_gateway_rest_api.main.id
  stage_name    = var.aws_api_gateway_stage_name

  tags = local.tags
}

resource "aws_api_gateway_usage_plan" "main" {
  name = var.aws_api_gateway_usage_plan

  api_stages {
    api_id = aws_api_gateway_rest_api.main.id
    stage  = aws_api_gateway_stage.main.stage_name
  }

  tags = local.tags
}

resource "aws_api_gateway_api_key" "main" {
  name = var.aws_api_gateway_api_key_name
}

resource "aws_api_gateway_usage_plan_key" "main" {
  key_id        = aws_api_gateway_api_key.main.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.main.id
}
