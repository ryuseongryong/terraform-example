module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.19.0"

  name = var.vpc_name

  cidr = "10.21.0.0/16"
  azs  = slice(data.aws_availability_zones.available.names, 0, 2)

  private_subnets = ["10.21.32.0/24", "10.21.33.0/24"]
  public_subnets  = ["10.21.0.0/24", "10.21.1.0/24"]

  enable_nat_gateway   = true
  single_nat_gateway   = !var.one_nat_gateway_per_az
  one_nat_gateway_per_az = var.one_nat_gateway_per_az
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
}