provider "aws" {
  region = "ap-south-1"
  access_key  = "fake"
  secret_key  = "fake"
  skip_credentials_validation = true

  endpoints {
    apigateway = "http://localhost:4566"
    iam        = "http://localhost:4566"
  }
}

resource "aws_api_gateway_rest_api" "my_api" {
  name        = "my_api"
  description = "This API is created for testing purposes with localstack."
}

resource "aws_api_gateway_resource" "root" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  parent_id   = aws_api_gateway_rest_api.my_api.root_resource_id
  path_part   = "test"
}

resource "aws_api_gateway_method" "get" {
  rest_api_id   = aws_api_gateway_rest_api.my_api.id
  resource_id   = aws_api_gateway_resource.root.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "test" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.root.id
  http_method = aws_api_gateway_method.get.http_method

  type                = "MOCK"
  request_templates   = {
    "application/json" = "{\"EverythingisWorkingFine\": 200}"
  }
}
