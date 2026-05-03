output "nlb_dns_name" {
  description = "DNS name of the Network Load Balancer."
  value       = module.nlb.nlb_dns_name
}

output "nlb_arn" {
  description = "ARN of the Network Load Balancer."
  value       = module.nlb.nlb_arn
}

output "target_group_arn" {
  description = "ARN of the NLB target group."
  value       = module.nlb.target_group_arn
}

output "listener_arn" {
  description = "ARN of the NLB listener."
  value       = module.nlb.listener_arn
}
