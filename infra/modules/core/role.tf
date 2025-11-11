data "aws_iam_policy_document" "lambda_assume_role_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]
    effect = "Allow"
    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role" "get_under_prefix_list" {
  name               = "${var.prefix}-get-under-prefix-list-${var.environment}"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "get_under_prefix_list" {
  role       = aws_iam_role.get_under_prefix_list.name
  policy_arn = aws_iam_policy.get_under_prefix_list.arn
}
