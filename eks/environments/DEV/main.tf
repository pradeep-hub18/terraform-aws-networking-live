data "terraform_remote_state" "networking" {
  backend = "s3"

  config = {
    bucket = var.networking_state_bucket
    key    = var.networking_state_key
    region = var.networking_state_region
  }
}

module "eks" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/eks?ref=v1.5.3"

  project_name                        = var.project_name
  environment                         = var.environment
  vpc_id                              = data.terraform_remote_state.networking.outputs.vpc_id
  private_subnet_ids                  = data.terraform_remote_state.networking.outputs.private_subnet_ids
  cluster_version                     = var.cluster_version
  endpoint_private_access             = var.endpoint_private_access
  endpoint_public_access              = var.endpoint_public_access
  node_instance_types                 = var.node_instance_types
  node_desired_size                   = var.node_desired_size
  node_min_size                       = var.node_min_size
  node_max_size                       = var.node_max_size
  node_disk_size                      = var.node_disk_size
  enable_argocd                       = var.enable_argocd
  argocd_namespace                    = var.argocd_namespace
  argocd_release_name                 = var.argocd_release_name
  argocd_chart_version                = var.argocd_chart_version
  argocd_values                       = var.argocd_values
  enable_aws_load_balancer_controller = var.enable_aws_load_balancer_controller
  enable_ebs_csi_driver               = var.enable_ebs_csi_driver
  enable_ebs_gp3_storage_class        = var.enable_ebs_gp3_storage_class
  enable_istio                        = var.enable_istio
  enable_istio_ingress_gateway        = var.enable_istio_ingress_gateway
  istio_ingress_gateway_service_type  = var.istio_ingress_gateway_service_type
  tags                                = var.tags
}
