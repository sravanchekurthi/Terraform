module "samplevpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
}

module "subnet" {
  source = "./modules/subnet"
  vpc_id = module.samplevpc.vpc_id
  cidr_block1 = var.cidr_block1
  availability_zone1 = var.availability_zone1
  map_public_ip_on_launch = var.map_public_ip_on_launch
  cidr_block2 = var.cidr_block2
  availability_zone2 = var.cidr_block2
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.samplevpc.vpc_id
}

module "rt" {
  source = "./modules/rt"
  vpc_id = module.samplevpc.vpc_id
  cidr_block_route = var.cidr_block_route
  gateway_id = module.igw.gateway_id
  subnet_id1 = module.subnet.subnet_id1.id
  subnet_id2 = module.subnet.subnet_id2.id
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.samplevpc.vpc_id
}

module "s3" {
  source = "./modules/s3"
  bucket = var.bucket_name
}

module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [module.sg.vpc_security_group_ids]
  subnet_id1 = module.subnet.subnet_id1
  subnet_id2 = module.subnet.subnet_id2
  user_data1 = var.user_data1
  user_data2 = var.user_data2
}

module "alb" {
  source = "./modules/alb"
  name = var.albname
  internal = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups = module.sg.vpc_security_group_ids
  subnets = [module.subnet.subnet_id1, module.subnet.subnet_id2]
  Name = var.Name
  tgname = var.tgname
  port = var.port
  protocol = var.protocol
  vpc_id = module.samplevpc.vpc_id
  path = var.path
  health_check_port = var.health_check_port
  target_id1 = module.ec2.target_id1
  target_id2 = module.ec2.target_id2
  type = var.type
}