resource "aws_lb" "samplealb" {
  name = var.name
  internal = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups = var.security_groups
  subnets = var.subnets
  tags = {
    Name = var.Name
  }
}

resource "aws_lb_target_group" "sampletg" {
  name = var.tgname
  port = var.port
  protocol = var.protocol
  vpc_id = var.vpc_id

  health_check {
    path = var.path
    port = var.health_check_port
  }
}

resource "aws_lb_target_group_attachment" "sampletga1" {
  target_group_arn = aws_lb_target_group.sampletg.arn
  target_id = var.target_id1
  port = var.port
}

resource "aws_lb_target_group_attachment" "sampletga2" {
  target_group_arn = aws_lb_target_group.sampletg.arn
  target_id = var.target_id2
  port = var.port
}

resource "aws_lb_listener" "samplelistener" {
  load_balancer_arn = aws_lb.samplealb.arn
  port = var.port
  protocol = var.protocol

  default_action {
    target_group_arn = aws_lb_target_group.sampletg.arn
    type = var.type
  }
}