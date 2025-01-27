module "vpc" {
  source             = "../../modules/vpc"
  cidr_block         = var.cidr_block
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  name               = var.name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

