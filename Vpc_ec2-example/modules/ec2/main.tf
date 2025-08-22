resource "aws_instance" "sample1" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id1
  user_data = var.user_data1
}

resource "aws_instance" "sample2" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id2
  user_data = var.user_data2
}