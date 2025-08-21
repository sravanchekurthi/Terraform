provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "terraform_lock" {
  name = var.name
  billing_mode = var.billing_mode
  hash_key = var.hash_key

  attribute {
    name = var.attribute_name
    type = var.type
  }
}