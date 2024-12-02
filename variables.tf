# AWS region
variable "region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-2"
}

# VPC configuration
variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "cameroon-vpc"
}

# Subnet configuration
variable "public_cidr_blocks" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_cidr_blocks" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones for the subnets"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "public_subnet_names" {
  description = "List of names for public subnets"
  type        = list(string)
  default     = ["public-subnet-1", "public-subnet-2", "public-subnet-3"]
}

# variable "private_subnet_names" {
#   description = "List of names for private subnets"
#   type        = list(string)
#   default     = ["private-subnet-1", "private-subnet-2", "private-subnet-3"]
# }

# variable "public_cidr_blocks" {
#   description = "CIDR blocks for public subnets"
#   type        = list(string)
# }

# variable "vpc_id" {
#   description = "ID of the VPC"
#   type        = string
# }

# variable "availability_zones" {
#   description = "List of availability zones"
#   type        = list(string)
# }

# variable "public_subnet_names" {
#   description = "Names of the public subnets"
#   type        = map(string)
# }

# variable "private_subnet_names" {
#   description = "Names of the private subnets"
#   type        = map(string)
# }
