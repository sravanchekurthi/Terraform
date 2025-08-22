resource "aws_security_group" "samplesg" {
  name = var.name
  vpc_id = var.vpc_id

  ingress {
    description = var.description1
    from_port = var.from_port1
    to_port = var.to_port1
    protocol = var.protocol1
    cidr_blocks = var.cidr_blocks
  }
  ingress {
    description = var.description2
    from_port = var.from_port2
    to_port = var.to_port2
    protocol = var.protocol1
    cidr_blocks = var.cidr_blocks
  }
  egress {
    from_port = var.from_port3
    to_port = var.to_port3
    protocol = var.protocol2
    cidr_blocks = var.cidr_blocks
  }
  tags = {
    Name = var.Name
  }
}