### ECS Service ###
resource "aws_ecs_service" "tf_ecs_service" {
  name = "terraform_ecs"
  capacity_provider_strategy {
    base              = 1
    capacity_provider = "FARGATE_SPOT"
    weight            = 1
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.alb_target_group.arn
    container_name   = "tf_ecr_repository"
    container_port   = 80
  }
  
  cluster       = aws_ecs_cluster.terraform_cluster.id
  desired_count = 1
  network_configuration {
    subnets = [
      aws_subnet.app_private_subnet_1a.id,
      aws_subnet.app_private_subnet_1c.id
    ]
    security_groups  = [aws_security_group.app_sg.id]
    assign_public_ip = false # private subnetに配置しているため
  }
  task_definition = aws_ecs_task_definition.my_flask_app.arn
  tags = {
    "Name" = "terraform"
  }

  lifecycle {
    ignore_changes = [
      task_definition, # デプロイ毎にタスク定義は変更されるため
      desired_count,
    ]
  }
}