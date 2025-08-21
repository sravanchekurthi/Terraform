provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "sample" {
  bucket = var.s3_bucket_name
}