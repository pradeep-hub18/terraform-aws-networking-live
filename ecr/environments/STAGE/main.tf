module "ecr" {
  source = "git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/ecr?ref=v1.5.2"

  project_name                          = var.project_name
  environment                           = var.environment
  repository_names                      = var.repository_names
  image_tag_mutability                  = var.image_tag_mutability
  force_delete                          = var.force_delete
  scan_on_push                          = var.scan_on_push
  encryption_type                       = var.encryption_type
  kms_key                               = var.kms_key
  enable_lifecycle_policy               = var.enable_lifecycle_policy
  untagged_image_expire_days            = var.untagged_image_expire_days
  max_tagged_image_count                = var.max_tagged_image_count
  create_full_access_policy             = var.create_full_access_policy
  full_access_policy_name               = var.full_access_policy_name
  full_access_iam_user_names            = var.full_access_iam_user_names
  full_access_iam_role_names            = var.full_access_iam_role_names
  full_access_iam_group_names           = var.full_access_iam_group_names
  repository_full_access_principal_arns = var.repository_full_access_principal_arns
  tags                                  = var.tags
}
