# IBM Cloud VPC Module

This module creates an IBM Cloud VPC along with optional subnets and public gateways.

## Inputs
- `name`: The name of the VPC.
- `resource_group`: The resource group to which the VPC belongs.
- `classic_access`: (Optional) Enable access to classic resources. Default is `false`.
- `subnets`: A list of subnets, where each subnet object requires:
  - `name`: The name of the subnet.
  - `cidr`: The CIDR block for the subnet.
  - `zone`: The zone where the subnet will be created.

## Outputs
- `vpc_id`: The ID of the VPC.
- `vpc_name`: The name of the VPC.
- `subnet_ids`: List of subnet IDs.
- `public_gateway_ids`: List of public gateway IDs.
