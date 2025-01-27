name            = "staging"
resource_group  = "staging-resource-group"
subnets         = ["192.168.1.0/28", "192.168.1.16/28"]
image           = "ibm-ubuntu-22-04"
profile         = "bx2-2x8"
instance_count  = 2
zone            = "us-south-1"
