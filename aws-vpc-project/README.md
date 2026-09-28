# AWS VPC Module

Terraform module that creates a VPC, one private subnet, one public subnet, and the internet gateway and route needed for public subnet access. The private subnet has no internet route or NAT gateway.

## Usage

Configure the AWS provider in the calling root module, then reference this module:

```hcl
provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./aws-vpc-project"

  vpc_name                  = "aws-project"
  vpc_cidr_block            = "10.0.0.0/16"
  private_subnet_cidr_block = "10.0.0.0/24"
  private_availability_zone = "us-east-1a"
  public_subnet_cidr_block  = "10.0.1.0/24"
  public_availability_zone  = "us-east-1b"
}
```

Terraform resolves local module sources relative to the calling configuration directory. The source above assumes the calling root module is at this repository's root. In `examples/basic/main.tf`, the source is `../..` because that example is nested two directories below the module root. Run `terraform init` and `terraform plan` from `aws-vpc-project/examples/basic` to try it.

## Inputs

| Name | Description | Default |
| --- | --- | --- |
| `vpc_name` | Name used for the VPC and related resources. | `aws-project` |
| `vpc_cidr_block` | IPv4 CIDR block for the VPC. | `10.0.0.0/16` |
| `private_subnet_cidr_block` | IPv4 CIDR block for the private subnet. | `10.0.0.0/24` |
| `private_availability_zone` | Availability zone for the private subnet. | `us-east-1a` |
| `public_subnet_cidr_block` | IPv4 CIDR block for the public subnet. | `10.0.1.0/24` |
| `public_availability_zone` | Availability zone for the public subnet. | `us-east-1b` |
| `enable_dns_support` | Whether DNS resolution is enabled in the VPC. | `true` |
| `enable_dns_hostnames` | Whether DNS hostnames are enabled in the VPC. | `true` |
| `tags` | Additional tags applied to all module resources. | `{}` |

## Outputs

| Name | Description |
| --- | --- |
| `vpc_id` | ID of the VPC. |
| `private_subnet_id` | ID of the private subnet. |
| `public_subnet_id` | ID of the public subnet. |
| `internet_gateway_id` | ID of the VPC internet gateway. |
| `public_route_table_id` | ID of the public subnet route table. |