variable "name" {
  description = "Base name for resources"
  type        = string
}

variable "resource_group" {
  description = "IBM Cloud Resource Group"
  type        = string
}

variable "subnets" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

variable "image" {
  description = "IBM Cloud Virtual Server Image"
  type        = string
}

variable "profile" {
  description = "Instance profile (e.g., bx2-2x8)"
  type        = string
}

variable "instance_count" {
  description = "Number of compute instances"
  type        = number
}

variable "zone" {
  description = "Zone for compute resources"
  type        = string
}
