variable "cidr_block" {
  description = "The CIDR block for the environment's VPC"
  type        = string
}

variable "enable_dns_support" {
  description = "Enable DNS support for the VPC"
  type        = bool
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC"
  type        = bool
}

variable "name" {
  description = "The name of the environment's VPC"
  type        = string
}
