
resource "aws_kms_key" "this" {
  key_usage                = "ENCRYPT_DECRYPT"
  customer_master_key_spec = "SYMMETRIC_DEFAULT"
  multi_region             = false

  policy = data.aws_iam_policy_document.this.json

  enable_key_rotation = false

  is_enabled = true
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.prefix}-${var.environment}"
  target_key_id = aws_kms_key.this.key_id
}
