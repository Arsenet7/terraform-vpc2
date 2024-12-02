variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "elastic_ip_ids" {
  description = "List of Elastic IP IDs"
  type        = list(string)
}

variable "nat_gateway_names" {
  description = "List of NAT Gateway names"
  type        = list(string)
}

variable "nat_gateway_ids" {
  description = "List of NAT Gateway IDs"
  type        = list(string)
}
