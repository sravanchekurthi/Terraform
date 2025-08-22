variable "name" {
  default = "sample"
  description = "value for security group name"
}

variable "vpc_id" {
  description = "value for vpc id"
}

variable "description1" {
  default = "HTTP from VPC"
  description = "value for description 1"
}

variable "from_port1" {
  default = 80
  description = "value for ingress from port 1"
}

variable "to_port1" {
  default = 80
  description = "value for ingress to port 1"
}

variable "protocol1" {
  default = "tcp"
  description = "value for protocol 1"
}

variable "cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "description2" {
  default = "SSH"
  description = "value for description 2"
}

variable "from_port2" {
  default = 22
  description = "value for ingress from port 2"
}

variable "to_port2" {
  default = 22
  description = "value for ingress to port 2"
}

variable "from_port3" {
  default = 0
  description = "value for egress from port 3"
}

variable "to_port3" {
  default = 0
  description = "value for egress to port 3"
}

variable "protocol2" {
  default = "-1"
  description = "value for protocol 2"
}

variable "Name" {
  default = "Sample-sg"
  description = "value for security group tag key name"
}