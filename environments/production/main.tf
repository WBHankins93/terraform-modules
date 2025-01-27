module "vpc" {
  source               = "../../modules/vpc-ibmc"
  name                 = var.name
  resource_group       = var.resource_group
  cidr_block           = "192.168.0.0/16"
  subnets              = var.subnets
  environment          = "prod"
}

module "compute" {
  source     = "../../modules/compute-ibmc"
  instances  = var.instances
}

module "databases" {
  source    = "../../modules/ibmc/databases"
  databases = var.databases
}