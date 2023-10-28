### SG ###
## app ##
resource "aws_security_group" "app_sg" {
    name        = "app-sg"
    description = "Application Security Group"
    vpc_id      = aws_vpc.tf_vpc.id
    tags = {
        Name = "tf-app-sg"
    } 
}

resource "aws_security_group_rule" "allow_alb_sg_inbound"{
    type                     = "ingress"
    from_port                = 80
    to_port                  = 80
    protocol                 = "tcp"
    security_group_id        = aws_security_group.app_sg.id
    source_security_group_id = aws_security_group.alb_sg.id
}

resource "aws_security_group_rule" "allow_every_outbound" {
    type              = "egress"
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    security_group_id = aws_security_group.app_sg.id
    cidr_blocks       = ["0.0.0.0/0"]
}

## ALB ##
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "ALB Security Group"
  vpc_id      = aws_vpc.tf_vpc.id
  tags = {
    Name = "tf-alb-sg"
  }
}

resource "aws_security_group_rule" "allow_http_inbound" {
    type                     = "ingress"
    from_port                = 80
    to_port                  = 80
    protocol                 = "tcp"
    security_group_id        = aws_security_group.alb_sg.id
    cidr_blocks              = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_app_sg_egress" {
    type                     = "egress"
    from_port                = 80
    to_port                  = 80
    protocol                 = "tcp"
    security_group_id        = aws_security_group.alb_sg.id
    source_security_group_id = aws_security_group.app_sg.id
}