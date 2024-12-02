resource "aws_nat_gateway" "gw" {
  count         = length(var.public_subnet_ids)
  allocation_id = var.elastic_ip_ids[count.index]
  subnet_id     = var.public_subnet_ids[count.index]
  tags = {
    Name = var.nat_gateway_names[count.index]
  }
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.gw[*].id
}
