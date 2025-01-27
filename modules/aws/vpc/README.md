# VPC Module

This module creates an AWS VPC.

## Inputs
- `cidr_block`: The CIDR block for the VPC.
- `enable_dns_support`: Whether to enable DNS support (default: true).
- `enable_dns_hostnames`: Whether to enable DNS hostnames (default: true).
- `name`: The name of the VPC (default: "default-vpc").

## Outputs
- `vpc_id`: The ID of the VPC.
- `vpc_cidr_block`: The CIDR block of the VPC.
