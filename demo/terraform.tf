terraform {
  backend "s3" {
    bucket = "demo-rsr-terraform-backend"
    region = "ap-northeast-2"
    key    = "demo.tfstate"
    profile = "ryuseongryong"
  }
}

module "common" {
  source = "../eks"

  region  = "ap-northeast-2"
  profile = "ryuseongryong"

  cluster_name = "demo"
  cluster_version = "1.32"

  vpc_name = "demo-vpc"
  one_nat_gateway_per_az = true
}

output "common" {
  value     = module.common
  sensitive = true
}

