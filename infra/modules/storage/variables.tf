variable "aws_region" {
  description = "AWS region for resources (S3, Route53, etc.)"
  type        = string
}

variable "prefix" {
  description = "Project name prefix"
  type        = string
}

variable "env" {
  description = "Environment name (eg: development, staging, production)"
  type        = string
}

locals {
  dist_files = fileset("${path.module}/../../../app/dist", "**")
  bucket_name = "${var.prefix}-static-${var.env}"
}