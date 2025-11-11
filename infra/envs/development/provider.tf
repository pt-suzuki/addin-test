provider "aws" {
  region = "ap-northeast-1"
  assume_role {
    role_arn = "arn:aws:iam::${local.account_id}:role/terraform-execution"
  }

  default_tags {
    tags = {
      Product        = "addin-test"
      Environment    = local.env
      ManagedBy      = "terraform"
    }
  }
}

provider "aws" {
  alias  = "useast1"
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::${local.account_id}:role/terraform-execution"
  }

  default_tags {
    tags = {
      Product        = "addin-test"
      Environment    = local.env
      ManagedBy      = "terraform"
    }
  }
}

terraform {
  backend "s3" {
    bucket   = "terraform-state-backend-config-pt-suzuki-app"
    key      = "addin-test/development.tfstate"
    region   = "ap-northeast-1"
  }
}