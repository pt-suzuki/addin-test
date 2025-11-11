resource "aws_cloudwatch_log_group" "get_under_prefix_list" {
  # nameは以下の形式にしないとlambdaから連携されない。
  name              = "/aws/lambda/${local.function_name}"
  retention_in_days = 7
}
