# # VPC Outputs
# output "vpc_id" {
#   description = "The ID of the VPC"
#   value       = aws_vpc.vpc.id
# }

# output "internet_gateway_id" {
#   description = "The ID of the Internet Gateway"
#   value       = aws_internet_gateway.igw.id
# }

# # Subnet Outputs
# output "public_subnet_ids" {
#   description = "List of public subnet IDs"
#   value       = aws_subnet.public.*.id
# }

# output "private_subnet_ids" {
#   description = "List of private subnet IDs"
#   value       = aws_subnet.private.*.id
# }

# # NAT Gateway Outputs
# output "nat_gateway_ids" {
#   description = "List of NAT Gateway IDs"
#   value       = aws_nat_gateway.gw.*.id
# }