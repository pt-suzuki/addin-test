variable "domain_name" {
  description = "Optional: your custom domain (eg: addin.example.com). Leave empty to use CloudFront domain."
  type        = string
}

variable "hosted_zone_id" {
  description = "Optional: Route53 hosted zone ID for domain_name. Required if domain_name is set and you want auto DNS."
  type        = string
}

variable "env" {
  description = "Environment name (eg: development, staging, production)"
  type        = string
}

variable "prefix" {
  description = "Project name prefix"
  type        = string
}

variable "bucket_id" {
  description = "The ID of the S3 bucket to be used as the origin for the CDN"
  type        = string
}

variable "oai_path" {
    description = "The path of the CloudFront Origin Access Identity"
    type        = string
}

variable "bucket_regional_domain_name" {
    description = "The regional domain name of the S3 bucket"
    type        = string
}