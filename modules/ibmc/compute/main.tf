resource "ibm_is_instance" "compute_instances" {
  count           = length(var.instances)
  name            = var.instances[count.index].name
  image           = var.instances[count.index].image
  profile         = var.instances[count.index].profile
  zone            = var.instances[count.index].zone
  resource_group  = var.instances[count.index].resource_group
  vpc             = ibm_is_vpc.main.id
}
