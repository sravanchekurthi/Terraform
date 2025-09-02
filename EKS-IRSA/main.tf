terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.20"
    }
  }
}

provider "aws" {
  region = var.region
}

module "irsa" {
  source               = "./modules/irsa"
  cluster_name         = var.cluster_name
  region               = var.region
  namespace            = var.namespace
  service_account_name = var.service_account_name
  s3_bucket_name       = var.s3_bucket_name
}
