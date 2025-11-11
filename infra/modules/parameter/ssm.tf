resource "aws_ssm_parameter" "slack_webhook_url" {
  name   = "${var.ssm_parameter_prefix}/SLACK_WEBHOOK_URL"
  value  = "DUMMY"
  key_id = var.kms_key_arn
  lifecycle {
    ignore_changes = [value]
  }
  type = "SecureString"
}
resource "aws_ssm_parameter" "slack_channel" {
  name   = "${var.ssm_parameter_prefix}/SLACK_CHANNEL"
  value  = "DUMMY"
  key_id = var.kms_key_arn
  lifecycle {
    ignore_changes = [value]
  }
  type = "SecureString"
}
