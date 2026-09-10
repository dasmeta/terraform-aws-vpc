output "id" {
  value       = module.vpc.vpc_id
  description = "The newly created vpc id"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "The newly created vpc private subnets IDs list"
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "The newly created vpc public subnets IDs list"
}

output "cidr_block" {
  value       = module.vpc.vpc_cidr_block
  description = "The cidr block of the vpc"
}

output "default_security_group_id" {
  value       = module.vpc.default_security_group_id
  description = "The ID of default security group created"
}

output "nat_public_ips" {
  value       = module.vpc.nat_public_ips
  description = "The list of elastic public IPs"
}

output "availability_zones" {
  value       = local.availability_zones
  description = "Availability zone names used for vpc creation"
}

# -----------------------------------------------------------------------------
# Route table outputs
# -----------------------------------------------------------------------------

output "default_route_table_id" {
  value       = module.vpc.default_route_table_id
  description = "The ID of the default route table for the VPC"
}

output "public_route_table_ids" {
  value       = module.vpc.public_route_table_ids
  description = "List of IDs of public route tables"
}

output "private_route_table_ids" {
  value       = module.vpc.private_route_table_ids
  description = "List of IDs of private route tables"
}

output "s3_gateway_endpoint_id" {
  value       = try(aws_vpc_endpoint.s3[0].id, null)
  description = "The ID of the Amazon S3 Gateway VPC endpoint, or null when disabled."
}
