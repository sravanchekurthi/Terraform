variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "cidr_block1" {
  description = "value"
}

variable "availability_zone1" {
  description = "value"
}

variable "map_public_ip_on_launch" {
  description = "value"
}

variable "cidr_block2" {
  description = "value"
}

variable "availability_zone2" {
  description = "value"
}

variable "cidr_block_route" {
  default = "0.0.0.0/0"
}

variable "bucket_name" {
  description = "value"
}

variable "ami_id" {
  description = "value"
}

variable "instance_type" {
  description = "value"
}

variable "user_data1" {
  default = base64encode(file(userdata.sh))
  description = "value for user data 1"
}

variable "user_data2" {
  default = base64encode(file(userdata1.sh))
  description = "value for user data 2"
}

variable "albname" {
  description = "value"
}

variable "internal" {
  description = "value"
}

variable "load_balancer_type" {
  description = "value"
}

variable "Name" {
  description = "value"
}

variable "tgname" {
  description = "value"
}
variable "port" {
  description = "value"
}

variable "protocol" {
  description = "value"
}

variable "path" {
  description = "value"
}

variable "health_check_port" {
  description = "value"
}

variable "type" {
  description = "value"
}