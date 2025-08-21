provider "aws" {
  region = "us-east-1"
}

resource "aws_route_table" "samplert" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.cidr_block
    gateway_id = var.igwid
  }
}

resource "aws_route_table_association" "samplerta" {
  subnet_id = var.subnet_id
  route_table_id = aws_route_table.samplert.id
}