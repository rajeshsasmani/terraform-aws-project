provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "tf1" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-ec2"
  }
}
