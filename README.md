# AWS Networking Live Infrastructure

This repository contains live Terraform configurations for AWS networking DEV and STAGE environments.

The reusable networking module is sourced from:

```hcl
git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/networking?ref=v1.0.0
```

- One VPC
- One public subnet
- One private subnet
- One Internet Gateway attached to the VPC
- One public route table with a default route to the Internet Gateway
- One private route table with a default route to the NAT Gateway
- One Elastic IP for the NAT Gateway
- One NAT Gateway created in the public subnet
- Route table associations for the public and private subnets

## Folder Structure

```text
terraform-module-aws-networking/
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

## Remote State

Each environment uses an S3 backend with DynamoDB state locking.

The backend is split into two files:

- `backend.tf` declares the S3 backend.
- `backend.hcl` stores the environment-specific backend values.

Before running `terraform init`, create the S3 bucket and DynamoDB lock table once.

Example AWS CLI commands:

```powershell
aws s3api create-bucket --bucket demo-network-terraform-state --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1
aws s3api put-bucket-versioning --bucket demo-network-terraform-state --versioning-configuration Status=Enabled
aws s3api put-bucket-encryption --bucket demo-network-terraform-state --server-side-encryption-configuration "{\"Rules\":[{\"ApplyServerSideEncryptionByDefault\":{\"SSEAlgorithm\":\"AES256\"}}]}"
aws dynamodb create-table --table-name demo-network-terraform-locks --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST --region ap-south-1
```

If you use a different bucket or table name, update both environment `backend.hcl` files.

## Usage

```powershell
cd environments/DEV
terraform init -backend-config="backend.hcl"
terraform plan
terraform apply
```

For STAGE:

```powershell
cd environments/STAGE
terraform init -backend-config="backend.hcl"
terraform plan
terraform apply
```

Environment-specific values are stored in each environment's `terraform.tfvars` file. The `main.tf` files only call the reusable networking module.

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

The workflow asks for:

```text
environment: DEV or STAGE
action: plan or apply
```

`terraform apply` runs only when you manually choose `apply`. If you choose `plan`, the workflow runs format check, init, validate, and plan only.

For extra protection, create GitHub Environments named `DEV` and `STAGE` in repository settings. Add required reviewers to `STAGE` if you want approval before apply runs there.
