provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "samplevpc" {
  cidr_block = var.cidr
}