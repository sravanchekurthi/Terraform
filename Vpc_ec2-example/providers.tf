terraform {
  required_providers {
    aws = {
        source = "hashicopr/aws"
        version = "5.11.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}