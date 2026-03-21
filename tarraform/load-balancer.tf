resource "aws_lb" "app_lb" {
  name               = "devops-alb-new"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]

  subnets = [
    aws_subnet.public_subnet1.id,
    aws_subnet.public_subnet2.id
  ]

  tags = {
    Name = "DevOps-ALB-New"
  }
}
