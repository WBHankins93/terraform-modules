output "vpc_id" {
  value = ibm_is_vpc.main.id
}

output "vpc_name" {
  value = ibm_is_vpc.main.name
}

output "subnet_ids" {
  value = [for subnet in ibm_is_subnet.subnets : subnet.id]
}

output "public_gateway_ids" {
  value = [for pgw in ibm_is_public_gateway.public_gateways : pgw.id]
}
