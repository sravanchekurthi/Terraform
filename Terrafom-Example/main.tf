provider "aws" {
  region = "us-east-1"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-1234567890"
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-1234567890"
}

module "s3" {
  source = "./modules/s3"
  s3_bucket_name = "sample-s3-terraform"
}

module "dynamodb" {
  source = "./modules/dynamodb"
  name = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute_name = "LockID"
  type = "S"
}
