provider "aws" {
  region = "us-east-1"
}

module "key_pair" {
  source = "./modules/key_pair"
  key_pair_name = "sample-terraform"
}

module "vpc" {
  source = "./modules/vpc"
  cidr = "10.0.0.0/16"
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id
  cidr_block = "0.0.0.0/0"
  igwid = module.internet_gateway.igwid
  subnet_id = module.subnet.subnet_id
}

module "security_group" {
  source = "./modules/security_group"
  sgname = "samplesg"
  vpc_id = module.vpc.vpc_id
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  amiid = "ami-1234567890"
  instancetype = "t2.micro"
  keyname = module.key_pair.key_pair_name
  sgid = module.security_group.samplesg.id
  subnetid = module.subnet.subnet_id.id
}