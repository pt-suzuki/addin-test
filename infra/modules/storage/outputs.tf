output "s3_bucket" {
  value = aws_s3_bucket.site.bucket
}

output "s3_bucket_id" {
  value = aws_s3_bucket.site.id
}

output "oai_path" {
    value = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
}

output "bucket_regional_domain_name" {
    value = aws_s3_bucket.site.bucket_regional_domain_name
}