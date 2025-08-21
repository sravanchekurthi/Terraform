terraform {
  backend "s3" {
    bucket = "sample-s3-terraform"
    key = "sample/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-lock"
  }
}