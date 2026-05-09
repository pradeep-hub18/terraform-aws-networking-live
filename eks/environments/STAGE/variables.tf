variable "aws_region" {
  description = "AWS region where EKS resources will be created."
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

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster."
  type        = string
  default     = "1.30"
}

variable "node_instance_types" {
  description = "EC2 instance types for the EKS managed node group."
  type        = list(string)
  default     = ["t3.large"]
}

variable "node_desired_size" {
  description = "Desired number of worker nodes in the managed node group."
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes in the managed node group."
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of worker nodes in the managed node group."
  type        = number
  default     = 2
}

variable "node_disk_size" {
  description = "Worker node root EBS volume size in GiB."
  type        = number
  default     = 20
}

variable "endpoint_private_access" {
  description = "Whether the EKS private API server endpoint is enabled."
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Whether the EKS public API server endpoint is enabled."
  type        = bool
  default     = true
}

variable "enable_argocd" {
  description = "Whether to install Argo CD into the EKS cluster."
  type        = bool
  default     = true
}

variable "argocd_namespace" {
  description = "Kubernetes namespace where Argo CD will be installed."
  type        = string
  default     = "argocd"
}

variable "argocd_release_name" {
  description = "Helm release name for Argo CD."
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "Optional Argo CD Helm chart version. Leave null to use the latest chart available from the repository."
  type        = string
  default     = null
}

variable "argocd_values" {
  description = "Optional Helm values YAML documents to pass to the Argo CD chart."
  type        = list(string)
  default     = []
}

variable "enable_aws_load_balancer_controller" {
  description = "Whether to install AWS Load Balancer Controller."
  type        = bool
  default     = true
}

variable "enable_ebs_csi_driver" {
  description = "Whether to install AWS EBS CSI driver."
  type        = bool
  default     = true
}

variable "enable_ebs_gp3_storage_class" {
  description = "Whether to create a default gp3 StorageClass."
  type        = bool
  default     = true
}

variable "enable_istio" {
  description = "Whether to install Istio base and istiod."
  type        = bool
  default     = true
}

variable "enable_istio_ingress_gateway" {
  description = "Whether to install Istio ingress gateway."
  type        = bool
  default     = true
}

variable "istio_ingress_gateway_service_type" {
  description = "Service type for Istio ingress gateway. Use ClusterIP when exposing through AWS Load Balancer Controller ALB Ingress."
  type        = string
  default     = "ClusterIP"
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

variable "tags" {
  description = "Additional tags to apply to all resources."
  type        = map(string)
  default     = {}
}
