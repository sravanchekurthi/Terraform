resource "aws_subnet" "sample1" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block1
  availability_zone = var.availability_zone1
  map_public_ip_on_launch = var.map_public_ip_on_launch
}

resource "aws_subnet" "sample2" {
  vpc_id = var.vpc_id
  cidr_block = var.cidr_block2
  availability_zone = var.availability_zone2
  map_public_ip_on_launch = var.map_public_ip_on_launch
}