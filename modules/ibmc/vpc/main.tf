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

resource "ibm_is_security_group" "security_groups" {
  count = length(var.security_groups)
  name  = var.security_groups[count.index].name
  vpc   = ibm_is_vpc.main.id

  dynamic "rule" {
    for_each = var.security_groups[count.index].rules
    content {
      direction = rule.value.direction
      protocol  = rule.value.protocol
      port_min  = rule.value.port_min
      port_max  = rule.value.port_max
      remote    = rule.value.remote
    }
  }
}

resource "ibm_is_lb" "load_balancers" {
  count    = length(var.load_balancers)
  name     = var.load_balancers[count.index].name
  subnets  = var.load_balancers[count.index].subnets
  type     = var.load_balancers[count.index].type
  vpc      = ibm_is_vpc.main.id
}
