variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_cidr_blocks" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_cidr_blocks" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones for subnets"
  type        = list(string)
}

variable "public_subnet_names" {
  description = "List of public subnet names"
  type        = list(string)
}

variable "private_subnet_names" {
  description = "List of private subnet names"
  type        = list(string)
}
