provider "aws" {
  region = "us-east-1"
}

resource "aws_subnet" "samplesubnet" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = var.map_public_ip_on_launch
}