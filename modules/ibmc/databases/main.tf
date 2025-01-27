resource "ibm_database" "postgres" {
  count          = length(var.databases)
  name           = var.databases[count.index].name
  engine_version = var.databases[count.index].engine_version
  resource_group = var.databases[count.index].resource_group
  storage_size   = var.databases[count.index].storage_size_gb

  admin_credentials {
    username = var.databases[count.index].admin_credentials.username
    password = var.databases[count.index].admin_credentials.password
  }
}
