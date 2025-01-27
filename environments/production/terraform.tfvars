name            = "prod"
resource_group  = "prod-resource-group"
subnets         = ["192.168.0.0/20", "192.168.16.0/20"]
image           = "ibm-ubuntu-22-04"
profile         = "bx2-4x16"
instance_count  = 5
zone            = "us-south-2"
