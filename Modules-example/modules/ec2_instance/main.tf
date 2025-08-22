provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "sample" {
  ami = var.ami_value
  instance_type = var.instance_type_value
  subnet_id = var.subnet_id_value
  associate_public_ip_address = true
}