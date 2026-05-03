variable "aws_region" {
  description = "AWS region where NLB resources will be created."
  type        = string
}

variable "project_name" {
  description = "Project name used for resource names and tags."
  type        = string
}

variable "environment" {
  description = "Environment name used for resource names and tags."
  type        = string
}

variable "internal" {
  description = "Whether the NLB is internal."
  type        = bool
  default     = false
}

variable "enable_deletion_protection" {
  description = "Whether deletion protection is enabled for the NLB."
  type        = bool
  default     = false
}

variable "listener_port" {
  description = "NLB listener port."
  type        = number
  default     = 80
}

variable "target_port" {
  description = "NodePort on the EKS worker nodes."
  type        = number
  default     = 30080
}

variable "health_check_port" {
  description = "Health check port. Use traffic-port to use the target group port."
  type        = string
  default     = "traffic-port"
}

variable "health_check_protocol" {
  description = "Health check protocol for the target group."
  type        = string
  default     = "TCP"
}

variable "networking_state_bucket" {
  description = "S3 bucket containing the networking Terraform state."
  type        = string
}

variable "networking_state_key" {
  description = "S3 key for the networking Terraform state."
  type        = string
}

variable "networking_state_region" {
  description = "AWS region of the networking Terraform state bucket."
  type        = string
}

variable "eks_state_bucket" {
  description = "S3 bucket containing the EKS Terraform state."
  type        = string
}

variable "eks_state_key" {
  description = "S3 key for the EKS Terraform state."
  type        = string
}

variable "eks_state_region" {
  description = "AWS region of the EKS Terraform state bucket."
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to all resources."
  type        = map(string)
  default     = {}
}
