provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "my_first_vcp" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "aws-project"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.my_first_vcp.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "aws-project-private"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.my_first_vcp.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "aws-project-public"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.my_first_vcp.id

  tags = {
    Name = "aws-project-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_first_vcp.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "aws-project-public"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
