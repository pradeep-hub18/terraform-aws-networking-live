data "terraform_remote_state" "networking" {
  backend = "s3"

  config = {
    bucket = var.networking_state_bucket
    key    = var.networking_state_key
    region = var.networking_state_region
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket = var.eks_state_bucket
    key    = var.eks_state_key
    region = var.eks_state_region
  }
}

module "nlb" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/nlb?ref=v1.2.0"

  project_name                           = var.project_name
  environment                            = var.environment
  vpc_id                                 = data.terraform_remote_state.networking.outputs.vpc_id
  subnet_ids                             = data.terraform_remote_state.networking.outputs.public_subnet_ids
  eks_node_group_autoscaling_group_names = data.terraform_remote_state.eks.outputs.node_group_autoscaling_group_names
  internal                               = var.internal
  enable_deletion_protection             = var.enable_deletion_protection
  listener_port                          = var.listener_port
  target_port                            = var.target_port
  health_check_port                      = var.health_check_port
  health_check_protocol                  = var.health_check_protocol
  tags                                   = var.tags
}
