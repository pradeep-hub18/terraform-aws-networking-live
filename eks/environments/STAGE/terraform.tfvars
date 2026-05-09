aws_region      = "ap-south-1"
project_name    = "demo-eks"
environment     = "STAGE"
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

enable_aws_load_balancer_controller = true
enable_ebs_csi_driver               = true
enable_ebs_gp3_storage_class        = true
enable_istio                        = true
enable_istio_ingress_gateway        = true
istio_ingress_gateway_service_type  = "ClusterIP"

networking_state_bucket = "pradeep-demo-network-terraform-state"
networking_state_key    = "networking/STAGE/terraform.tfstate"
networking_state_region = "ap-south-1"

tags = {
  Owner      = "platform-team"
  ManagedBy  = "terraform"
  CostCenter = "learning"
}
