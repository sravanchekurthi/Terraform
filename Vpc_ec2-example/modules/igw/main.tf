resource "aws_internet_gateway" "sampleigw" {
  vpc_id = var.vpc_id
}