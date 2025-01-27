resource "ibm_is_vpc" "main" {
  name = var.name
  resource_group = var.resource_group
  classic_access = var.classic_access
}

resource "ibm_is_subnet" "subnets" {
  count         = length(var.subnets)
  name          = var.subnets[count.index].name
  vpc           = ibm_is_vpc.main.id
  ipv4_cidr_block = var.subnets[count.index].cidr
  zone          = var.subnets[count.index].zone
}

resource "ibm_is_public_gateway" "public_gateways" {
  count  = length(var.subnets)
  name   = "${var.name}-pgw-${count.index}"
  vpc    = ibm_is_vpc.main.id
  zone   = var.subnets[count.index].zone
}
