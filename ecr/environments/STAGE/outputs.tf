output "repository_names" {
  description = "ECR repository names."
  value       = module.ecr.repository_names
}

output "repository_arns" {
  description = "ECR repository ARNs."
  value       = module.ecr.repository_arns
}

output "repository_urls" {
  description = "ECR repository URLs."
  value       = module.ecr.repository_urls
}

output "repositories" {
  description = "ECR repository details keyed by repository name."
  value       = module.ecr.repositories
}

output "full_access_policy_arn" {
  description = "ARN of the IAM policy granting full access to the managed ECR repositories."
  value       = module.ecr.full_access_policy_arn
}

output "full_access_policy_name" {
  description = "Name of the IAM policy granting full access to the managed ECR repositories."
  value       = module.ecr.full_access_policy_name
}
