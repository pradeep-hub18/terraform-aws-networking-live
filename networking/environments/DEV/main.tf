module "networking" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/networking?ref=v1.1.0"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
  tags                 = var.tags
}
