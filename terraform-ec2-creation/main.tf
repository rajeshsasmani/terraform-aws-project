provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "tf1" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-ec2"
  }
}
