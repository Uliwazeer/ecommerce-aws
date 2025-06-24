output "frontend_url" {
  value = aws_s3_bucket_website_configuration.website_config.website_endpoint
}

output "api_url" {
  value = aws_apigatewayv2_api.http_api.api_endpoint
}
