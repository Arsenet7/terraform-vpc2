resource "aws_subnet" "public" {
  count                   = length(var.public_cidr_blocks)
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_cidr_blocks[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = var.public_subnet_names[count.index]
  }
}

resource "aws_subnet" "private" {
  count             = length(var.private_cidr_blocks)
  vpc_id            = var.vpc_id
  cidr_block        = var.private_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = var.private_subnet_names[count.index]
  }
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "public_subnet_names" {
  value = var.public_subnet_names
}

output "private_subnet_names" {
  value = var.private_subnet_names
}
