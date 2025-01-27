module "vpc" {
  source               = "../../modules/vpc-ibmc"
  name                 = var.name
  resource_group       = var.resource_group
  cidr_block           = "192.168.0.0/16"
  subnets              = var.subnets
  environment          = "prod"
}

module "compute" {
  source               = "../../modules/compute-ibmc"
  name                 = var.name
  resource_group       = var.resource_group
  environment          = "prod"
  image                = var.image
  profile              = var.profile
  instance_count       = var.instance_count
  zone                 = var.zone
}
