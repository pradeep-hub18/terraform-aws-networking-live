# AWS NLB Live Infrastructure

Live Terraform configuration for a Network Load Balancer in front of the EKS worker node group.

The NLB stack reads:

- Networking remote state for `vpc_id` and `public_subnet_ids`
- EKS remote state for `node_group_autoscaling_group_names`

Apply order:

```text
networking -> eks -> nlb
```
