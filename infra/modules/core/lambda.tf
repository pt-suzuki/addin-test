resource "aws_lambda_function" "get_under_prefix_list" {
  function_name = local.function_name
  package_type  = var.package_type
  architectures = var.architectures

  image_uri = "${var.repository_url}:${var.environment}"
  image_config {
    command = ["lambda.lambda_get_under_prefix_list.handler"]
  }

  memory_size = 1024
  timeout     = local.timeout
  role        = aws_iam_role.get_under_prefix_list.arn
  environment {
    variables = {
      ENV         = var.environment
      BUCKET_NAME = var.patent_bulkdata_bucket_name
    }
  }
}


resource "aws_lambda_function_event_invoke_config" "get_under_prefix_list" {
  function_name = aws_lambda_function.get_under_prefix_list.function_name
  # triggerの間隔が6時間なので6時間に設定。
  maximum_event_age_in_seconds = 60 * 60 * 6
  maximum_retry_attempts       = 0
}