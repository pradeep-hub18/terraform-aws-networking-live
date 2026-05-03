aws_region           = "ap-south-1"
project_name         = "demo-network"
environment          = "STAGE"
vpc_cidr             = "10.20.0.0/16"
public_subnet_cidr   = "10.20.1.0/24"
private_subnet_cidrs = ["10.20.2.0/24", "10.20.3.0/24"]
availability_zones   = ["ap-south-1a", "ap-south-1b"]

tags = {
  Owner      = "platform-team"
  ManagedBy  = "terraform"
  CostCenter = "learning"
}
