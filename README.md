# Terraform AWS Resources Provision

Live Terraform configurations for AWS networking, EKS, and NLB resources.

## Structure

```text
terraform-aws-resources-provision/
+-- networking/
|   +-- environments/
|       +-- DEV/
|       +-- STAGE/
+-- eks/
|   +-- environments/
|       +-- DEV/
|       +-- STAGE/
+-- nlb/
|   +-- environments/
|       +-- DEV/
|       +-- STAGE/
+-- .github/
    +-- workflows/
        +-- terraform.yml
```

## Run Order

Apply networking first, then EKS, then NLB.

EKS reads these networking remote state outputs:

- `vpc_id`
- `private_subnet_ids`

NLB reads these remote state outputs:

- From networking: `vpc_id`, `public_subnet_ids`
- From EKS: `node_group_autoscaling_group_names`

## Remote State

Both components use the same S3 bucket and DynamoDB lock table:

```text
bucket: padeep-demo-network-terraform-state
dynamodb_table: demo-network-terraform-locks
region: ap-south-1
```

State keys:

```text
networking/DEV/terraform.tfstate
networking/STAGE/terraform.tfstate
eks/DEV/terraform.tfstate
eks/STAGE/terraform.tfstate
nlb/DEV/terraform.tfstate
nlb/STAGE/terraform.tfstate
```

## GitHub Actions

Workflow:

```text
.github/workflows/terraform.yml
```

Manual inputs:

```text
component: networking, eks, or nlb
environment: DEV or STAGE
action: plan, apply, destroy, or refresh
```

Required secrets:

```text
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```
