resource "aws_s3_object" "dist_objects" {
  for_each = { for f in local.dist_files : f => f }

  bucket       = aws_s3_bucket.site.id
  key          = each.key
  source       = "${path.module}/../../../app/dist/${each.key}"
  etag         = filemd5("${path.module}/../../../app/dist/${each.key}")
  content_type = lookup(
    {
      "html" = "text/html",
      "js"   = "application/javascript",
      "css"  = "text/css",
      "json" = "application/json",
      "xml"  = "application/xml"
    },
    split(".", each.key)[length(split(".", each.key)) - 1],
    "application/octet-stream"
  )
}

resource "aws_s3_object" "manifest" {
  bucket       = aws_s3_bucket.site.id
  key          = "manifest.xml"
  source       = "${path.module}/../../../app/manifest.xml"
  content_type = "application/xml"
}