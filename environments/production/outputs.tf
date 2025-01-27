output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_ids" {
  value = module.vpc.subnet_ids
}

output "compute_instance_ids" {
  value = module.compute.instance_ids
}
