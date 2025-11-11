output "manifest_url" {
  value = "https://${aws_cloudfront_distribution.cdn.domain_name}/manifest.xml"
}

output "cloudfront_domain" {
  value = aws_cloudfront_distribution.cdn.domain_name
}

output "site_url" {
  value = var.domain_name != "" ? "https://${var.domain_name}" : "https://${aws_cloudfront_distribution.cdn.domain_name}"
}