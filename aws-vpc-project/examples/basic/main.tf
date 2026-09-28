provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../.."

  vpc_name                    = "aws-project"
  vpc_cidr_block              = "10.0.0.0/16"
  private_subnet_cidr_block   = "10.0.0.0/24"
  private_availability_zone   = "us-east-1a"
  public_subnet_cidr_block    = "10.0.1.0/24"
  public_availability_zone    = "us-east-1b"
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_id
}

output "public_subnet_id" {
  value = module.vpc.public_subnet_id
}