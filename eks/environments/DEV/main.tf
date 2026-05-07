data "terraform_remote_state" "networking" {
  backend = "s3"

  config = {
    bucket = var.networking_state_bucket
    key    = var.networking_state_key
    region = var.networking_state_region
  }
}

module "eks" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/eks?ref=v1.3.0"

  project_name            = var.project_name
  environment             = var.environment
  vpc_id                  = data.terraform_remote_state.networking.outputs.vpc_id
  private_subnet_ids      = data.terraform_remote_state.networking.outputs.private_subnet_ids
  cluster_version         = var.cluster_version
  endpoint_private_access = var.endpoint_private_access
  endpoint_public_access  = var.endpoint_public_access
  node_instance_types     = var.node_instance_types
  node_desired_size       = var.node_desired_size
  node_min_size           = var.node_min_size
  node_max_size           = var.node_max_size
  node_disk_size          = var.node_disk_size
  enable_argocd           = var.enable_argocd
  argocd_namespace        = var.argocd_namespace
  argocd_release_name     = var.argocd_release_name
  argocd_chart_version    = var.argocd_chart_version
  argocd_values           = var.argocd_values
  tags                    = var.tags
}
