provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region.
}

resource "aws_key_pair" "sample" {
  key_name = var.key_pair_name    # Replace with your desired key name
  public_key = file("~/.ssh/id_rsa.pub")  # Replace with the path to your public key file
}