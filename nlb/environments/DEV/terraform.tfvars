aws_region   = "ap-south-1"
project_name = "demo-nlb"
environment  = "DEV"

internal                   = false
enable_deletion_protection = false
listener_port              = 80
target_port                = 30080
health_check_port          = "traffic-port"
health_check_protocol      = "TCP"

networking_state_bucket = "padeep-demo-network-terraform-state"
networking_state_key    = "networking/DEV/terraform.tfstate"
networking_state_region = "ap-south-1"

eks_state_bucket = "padeep-demo-network-terraform-state"
eks_state_key    = "eks/DEV/terraform.tfstate"
eks_state_region = "ap-south-1"

tags = {
  Owner      = "platform-team"
  ManagedBy  = "terraform"
  CostCenter = "learning"
}
