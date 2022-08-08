output "invoke_url" {
  value = aws_api_gateway_stage.main.invoke_url
}

output "api_key" {
  sensitive = true
  value     = aws_api_gateway_api_key.main.value
}
