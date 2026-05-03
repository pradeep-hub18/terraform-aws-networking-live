# AWS Networking Live Infrastructure

Live Terraform configuration for AWS networking DEV and STAGE environments.

The reusable networking module is sourced from:

```hcl
git::https://github.com/pradeep-hub18/my-terraform-modules.git//modules/networking?ref=v1.1.0
```

Resources:

- One VPC
- One public subnet
- Two private subnets across two Availability Zones
- Internet Gateway
- Public route table
- Private route table
- NAT Gateway and Elastic IP
- Route table associations

## Usage

```powershell
cd networking/environments/DEV
terraform init -backend-config="backend.hcl"
terraform plan
terraform apply
```
