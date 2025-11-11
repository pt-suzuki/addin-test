resource "aws_acm_certificate" "cert" {
  provider          = aws.useast1
  count             = var.domain_name != "" ? 1 : 0
  domain_name       = var.domain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation_complete" {
  count                       = var.domain_name != "" && var.hosted_zone_id != "" ? 1 : 0
  provider                    = aws.useast1
  certificate_arn             = aws_acm_certificate.cert[0].arn
  validation_record_fqdns     = try([for r in aws_route53_record.cert_validation : r.fqdn], [])
}