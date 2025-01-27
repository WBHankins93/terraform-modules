variable "name" {
  description = "The name of the VPC"
  type        = string
}

variable "resource_group" {
  description = "The resource group for the VPC"
  type        = string
}

variable "classic_access" {
  description = "Enable access to classic infrastructure resources"
  type        = bool
  default     = false
}

variable "subnets" {
  description = "A list of subnet configurations"
  type = list(object({
    name = string
    cidr = string
    zone = string
  }))
}
