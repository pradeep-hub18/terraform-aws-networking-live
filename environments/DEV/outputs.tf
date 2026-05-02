output "vpc_id" {
  description = "ID of the created VPC."
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "ID of the public subnet."
  value       = module.networking.public_subnet_id
}

output "private_subnet_id" {
  description = "ID of the private subnet."
  value       = module.networking.private_subnet_id
}

output "internet_gateway_id" {
  description = "ID of the internet gateway."
  value       = module.networking.internet_gateway_id
}

output "nat_gateway_id" {
  description = "ID of the NAT gateway."
  value       = module.networking.nat_gateway_id
}

output "public_route_table_id" {
  description = "ID of the public route table."
  value       = module.networking.public_route_table_id
}

output "private_route_table_id" {
  description = "ID of the private route table."
  value       = module.networking.private_route_table_id
}
