resource "aws_lb_target_group_attachment" "app1" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.app1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "app2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.app2.id
  port             = 80
}
