variable "databases" {
  description = "List of databases to create"
  type = list(object({
    name              = string
    engine_version    = string
    instance_type     = string
    resource_group    = string
    storage_size_gb   = number
    admin_credentials = object({
      username = string
      password = string
    })
  }))
}
