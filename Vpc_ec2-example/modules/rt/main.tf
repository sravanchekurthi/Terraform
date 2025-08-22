resource "aws_route_table" "samplert" {
  vpc_id = var.vpc_id

  route {
    cidr_block = var.cidr_block_route
    gateway_id = var.gateway_id
  }
}

resource "aws_route_table_association" "samplerta1" {
  subnet_id = var.subnet_id1
  route_table_id = aws_route_table.samplert.id
}

resource "aws_route_table_association" "samplerta2" {
  subnet_id = var.subnet_id2
  route_table_id = aws_route_table.samplert.id
}