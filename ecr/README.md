# AWS ECR Live Infrastructure

Live Terraform configuration for Amazon ECR repositories used by the microservices Jenkins pipeline.

The reusable ECR module is sourced from:

```hcl
git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/ecr?ref=v1.4.0
```

Resources created:

- ECR repository for `microapps/auth-service`
- ECR repository for `microapps/catalog-service`
- ECR scan-on-push enabled
- ECR lifecycle cleanup policy
- IAM managed policy granting full access to the managed ECR repositories
- Optional IAM user, role, and group attachments for the full-access policy

## Usage

```sh
cd ecr/environments/DEV
terraform init -backend-config="backend.hcl"
terraform plan
terraform apply
```

For STAGE:

```sh
cd ecr/environments/STAGE
terraform init -backend-config="backend.hcl"
terraform plan
terraform apply
```
