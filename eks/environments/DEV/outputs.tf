output "cluster_name" {
  description = "Name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "cluster_arn" {
  description = "ARN of the EKS cluster."
  value       = module.eks.cluster_arn
}

output "cluster_endpoint" {
  description = "Endpoint URL for the EKS API server."
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security group ID created for the EKS cluster."
  value       = module.eks.cluster_security_group_id
}

output "cluster_iam_role_arn" {
  description = "ARN of the IAM role used by the EKS control plane."
  value       = module.eks.cluster_iam_role_arn
}

output "node_group_name" {
  description = "Name of the EKS managed node group."
  value       = module.eks.node_group_name
}

output "node_group_arn" {
  description = "ARN of the EKS managed node group."
  value       = module.eks.node_group_arn
}

output "node_group_iam_role_arn" {
  description = "ARN of the IAM role used by the EKS managed node group."
  value       = module.eks.node_group_iam_role_arn
}

output "node_group_autoscaling_group_names" {
  description = "Auto Scaling Group names backing the EKS managed node group."
  value       = module.eks.node_group_autoscaling_group_names
}
