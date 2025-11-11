resource "aws_route53_record" "cert_validation" {
  count = (var.domain_name != "" && var.hosted_zone_id != "") ? length(aws_acm_certificate.cert[0].domain_validation_options) : 0

  zone_id = var.hosted_zone_id
  name    = aws_acm_certificate.cert[0].domain_validation_options[count.index].resource_record_name
  type    = aws_acm_certificate.cert[0].domain_validation_options[count.index].resource_record_type
  ttl     = 60
  records = [aws_acm_certificate.cert[0].domain_validation_options[count.index].resource_record_value]
}