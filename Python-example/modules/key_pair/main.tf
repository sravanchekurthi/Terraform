provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "sample" {
  key_name = var.key_pair_name
  public_key = file("~/.ssh/id_rsa.pub")
}