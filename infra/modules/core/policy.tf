data "aws_iam_policy_document" "get_under_prefix_list_policy" {
  statement {
    actions = [
      "logs:CreateLogStream",
    ]
    effect = "Allow"
    resources = [
      "${aws_cloudwatch_log_group.get_under_prefix_list.arn}:*",
    ]
  }
  statement {
    actions = [
      "logs:PutLogEvents",
    ]
    effect = "Allow"
    resources = [
      "${aws_cloudwatch_log_group.get_under_prefix_list.arn}:*:*",
    ]
  }
  statement {
    actions = [
      "s3:*",
    ]
    effect = "Allow"
    resources = [
      "arn:aws:s3:::${var.patent_bulkdata_bucket_name}",
      "arn:aws:s3:::${var.patent_bulkdata_bucket_name}/*",
    ]
  }
}

resource "aws_iam_policy" "get_under_prefix_list" {
  name   = "${var.prefix}-get-under-prefix-list-${var.environment}"
  policy = data.aws_iam_policy_document.get_under_prefix_list_policy.json
}