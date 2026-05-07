aws_region      = "ap-south-1"
project_name    = "demo-eks"
environment     = "DEV"
cluster_version = "1.30"

node_instance_types = ["t3.large"]
node_desired_size   = 2
node_min_size       = 2
node_max_size       = 2
node_disk_size      = 20

endpoint_private_access = true
endpoint_public_access  = true

enable_argocd        = true
argocd_namespace     = "argocd"
argocd_release_name  = "argocd"
argocd_chart_version = null
argocd_values        = []

networking_state_bucket = "padeep-demo-network-terraform-state"
networking_state_key    = "networking/DEV/terraform.tfstate"
networking_state_region = "ap-south-1"

tags = {
  Owner      = "platform-team"
  ManagedBy  = "terraform"
  CostCenter = "learning"
}
