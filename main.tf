provider "aws" {
  region = "us-east-2"
}

# Create VPC
module "vpc" {
  source               = "./modules/vpc"
  cidr_block           = "10.0.0.0/16"
  vpc_name             = "cameroon-vpc"
  public_cidr_blocks   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_cidr_blocks  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones   = ["us-east-2a", "us-east-2b", "us-east-2c"]
  public_subnet_names  = ["public-subnet-1", "public-subnet-2", "public-subnet-3"]
  private_subnet_names = ["private-subnet-1", "private-subnet-2", "private-subnet-3"]
}

# Create Subnets
module "subnet" {
  source               = "./modules/subnet"
  vpc_id               = module.vpc.vpc_id
  public_cidr_blocks   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_cidr_blocks  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones   = ["us-east-2a", "us-east-2b", "us-east-2c"]
  public_subnet_names  = ["public-subnet-1", "public-subnet-2", "public-subnet-3"]
  private_subnet_names = ["private-subnet-1", "private-subnet-2", "private-subnet-3"]
}

# Create Elastic IPs for NAT Gateways
resource "aws_eip" "nat" {
  count  = 3
  domain = "vpc"
}

# Create 3 NAT Gateways
module "nat_gateway" {
  source            = "./modules/nat_gateway"
  public_subnet_ids = module.subnet.public_subnet_ids
  nat_gateway_ids   = module.nat_gateway.nat_gateway_ids
  elastic_ip_ids    = aws_eip.nat[*].id
  nat_gateway_names = ["nat-gateway-1", "nat-gateway-2", "nat-gateway-3"]
}

# Create Route Tables
module "route_table" {
  source               = "./modules/route_table"
  vpc_id               = module.vpc.vpc_id
  internet_gateway_id  = module.vpc.internet_gateway_id
  nat_gateway_ids      = module.nat_gateway.nat_gateway_ids
  public_subnet_ids    = module.subnet.public_subnet_ids
  private_subnet_ids   = module.subnet.private_subnet_ids
  public_subnet_names  = module.subnet.public_subnet_names
  private_subnet_names = module.subnet.private_subnet_names
}

# Outputs (referencing module outputs)
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}

output "public_subnet_ids" {
  value = module.subnet.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.subnet.private_subnet_ids
}

output "nat_gateway_ids" {
  value = module.nat_gateway.nat_gateway_ids
}
