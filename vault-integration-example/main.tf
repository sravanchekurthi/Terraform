provider "aws" {
  region = "us-east-1"
}

module "vault" {
  source = "./modules/vault"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_id = "ami-1234567890"
  instance_type = "t2-micro"
  secret = module.vault.secret 
}