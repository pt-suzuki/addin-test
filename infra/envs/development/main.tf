module "storage" {
  source      = "../../modules/storage"
  env = local.env
  prefix = local.prefix
  aws_region = local.aws_region
}

module "cdn" {
  source      = "../../modules/cdn"
  env = local.env
  prefix = local.prefix
  domain_name = ""
  hosted_zone_id = ""
  bucket_id = module.storage.s3_bucket_id
  oai_path = module.storage.oai_path
  bucket_regional_domain_name = module.storage.bucket_regional_domain_name

  providers = {
    aws.useast1 = aws.useast1
  }
}