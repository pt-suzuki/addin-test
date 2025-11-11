resource "aws_api_gateway_rest_api" "api_gateway" {
  name = "${var.prefix}-add-media-slack-bot-api-${var.environment}"

  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "api"
      version = "1.0"
    }
    paths = {
      "/slack/events" = {
        post = {
          x-amazon-apigateway-integration = {
            httpMethod           = "POST" # LambdaへのアクセスはPOSTでないといけないらしい
            payloadFormatVersion = "1.0"
            type                 = "AWS_PROXY"
            uri                  = aws_lambda_function.this.invoke_arn
            credentials          = aws_iam_role.api_gateway.arn
          }
        }
      }
    }
  })
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.api_gateway.id
  depends_on  = [aws_api_gateway_rest_api.api_gateway]
  triggers = {
    # resource "aws_lambda_function" "api" の内容が変わるごとにデプロイされるようにする
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.api_gateway))
  }
}