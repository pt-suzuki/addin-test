variable "environment" {}
variable "package_type" {}
variable "architectures" {}
variable "prefix" {}
variable "patent_bulkdata_bucket_name" {}
variable "repository_url" {}

locals {
  timeout       = 60 * 15
  function_name = "${var.prefix}-get-under-prefix-list-${var.environment}"
}