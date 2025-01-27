variable "instances" {
  description = "List of instances to create"
  type = list(object({
    name           = string
    image          = string
    profile        = string
    zone           = string
    resource_group = string
  }))
}
