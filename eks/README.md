# AWS EKS Live Infrastructure

This repository contains live Terraform configurations for Amazon EKS DEV and STAGE environments.

The reusable EKS module is sourced from:

```hcl
git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/eks?ref=v1.3.0
```

Each environment reads the networking remote state to get:

- VPC ID
- Private subnet IDs

Resources created by the EKS module:

- EKS control plane IAM role and AWS managed policy attachment
- EKS node group IAM role and AWS managed policy attachments
- Allow-all EKS security group
- EKS cluster
- EKS managed node group with two `t3.large` workers by default
- Argo CD namespace named `argocd`
- Argo CD Helm release named `argocd`

## Folder Structure

```text
eks/
+-- environments/
|   +-- DEV/
|   |   +-- backend.tf
|   |   +-- backend.hcl
|   |   +-- main.tf
|   |   +-- providers.tf
|   |   +-- variables.tf
|   |   +-- outputs.tf
|   |   +-- terraform.tfvars
|   +-- STAGE/
|       +-- backend.tf
|       +-- backend.hcl
|       +-- main.tf
|       +-- providers.tf
|       +-- variables.tf
|       +-- outputs.tf
|       +-- terraform.tfvars
```

## Usage

Run networking first so its remote state contains `vpc_id` and `private_subnet_ids`.

```powershell
cd eks/environments/DEV
terraform init -backend-config="backend.hcl"
terraform plan
terraform apply
```

For STAGE:

```powershell
cd eks/environments/STAGE
terraform init -backend-config="backend.hcl"
terraform plan
terraform apply
```

## GitHub Actions

Terraform runs manually from GitHub Actions.

Workflow:

```text
.github/workflows/terraform.yml
```

Required GitHub repository secrets:

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

The workflow downloads the reusable EKS module from the `v1.3.0` Git tag.

Argo CD is enabled by default in each environment:

```hcl
enable_argocd        = true
argocd_namespace     = "argocd"
argocd_release_name  = "argocd"
argocd_chart_version = null
argocd_values        = []
```

Set `enable_argocd = false` in an environment tfvars file to skip the Argo CD install.

The workflow asks for:

```text
component: eks
environment: DEV or STAGE
action: plan, apply, destroy, or refresh
```

Actions:

- `plan` runs `terraform plan`
- `apply` runs `terraform apply -auto-approve`
- `destroy` runs `terraform plan -destroy`, then `terraform destroy -auto-approve`
- `refresh` runs `terraform plan -refresh-only`, then `terraform apply -refresh-only -auto-approve`

For extra protection, create GitHub Environments named `DEV` and `STAGE` in repository settings. Add required reviewers to `STAGE` before allowing apply or destroy.
