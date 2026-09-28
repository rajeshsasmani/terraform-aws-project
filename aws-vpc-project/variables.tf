variable "vpc_name" {
  description = "Name used for the VPC and related resources."
  type        = string
  default     = "aws-project"
}

variable "vpc_cidr_block" {
  description = "IPv4 CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_cidr_block" {
  description = "IPv4 CIDR block for the private subnet."
  type        = string
  default     = "10.0.0.0/24"
}

variable "public_subnet_cidr_block" {
  description = "IPv4 CIDR block for the public subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_availability_zone" {
  description = "Availability zone for the private subnet."
  type        = string
  default     = "us-east-1a"
}

variable "public_availability_zone" {
  description = "Availability zone for the public subnet."
  type        = string
  default     = "us-east-1b"
}

variable "enable_dns_support" {
  description = "Whether DNS resolution is enabled in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether DNS hostnames are enabled in the VPC."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags applied to all module resources."
  type        = map(string)
  default     = {}
}