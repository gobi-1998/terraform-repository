provider "aws" {
}

# This is VPC code
resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
}

# This is Subnet code
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.test-vpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Public-subnet"
  }
}
# EC2 instance code
resource "aws_instance" "sanjay-server" {
  ami             = "ami-05c13eab67c5d8861"
  subnet_id       = aws_subnet.public-subnet.id
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.ltitestkey.key_name

  tags = {
    Name     = "test-World"
    Stage    = "testing"
    Location = "chennai"
  }
}
