module "vpc" {
  source               = "../../modules/vpc-ibmc"
  name                 = var.name
  resource_group       = var.resource_group
  cidr_block           = "192.168.1.0/24"
  subnets              = var.subnets
  environment          = "staging"
}

module "compute" {
  source               = "../../modules/compute-ibmc"
  name                 = var.name
  resource_group       = var.resource_group
  environment          = "staging"
  image                = var.image
  profile              = var.profile
  instance_count       = var.instance_count
  zone                 = var.zone
}