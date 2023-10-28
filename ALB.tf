### ALB ###
resource "aws_alb" "alb" {
  name               = "terraform-test-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets = [
    aws_subnet.alb_public_subnet_1a.id,
    aws_subnet.alb_public_subnet_1c.id,
  ]
}