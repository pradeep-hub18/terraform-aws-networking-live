aws_region          = "ap-south-1"
project_name        = "demo-network"
environment         = "DEV"
vpc_cidr            = "10.10.0.0/16"
public_subnet_cidr  = "10.10.1.0/24"
private_subnet_cidr = "10.10.2.0/24"
availability_zone   = "ap-south-1a"

tags = {
  Owner      = "platform-team"
  ManagedBy  = "terraform"
  CostCenter = "learning"
}
