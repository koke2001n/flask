###ECRリポジトリを定義###
resource "aws_ecr_repository" "tf_ecr_repository" {
  name                 = "tf_ecr_repository" #ECRリポジトリの名前を指定
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}


###ECR取得###
data "aws_ecr_repository" "tf_ecr_repository" {
  name = aws_ecr_repository.tf_ecr_repository.name  # ECRリポジトリの名前を指定
}


### ECS Task Definition
resource "aws_ecs_task_definition" "my_flask_app" {
  family                   = "tf_ecr_repository"
  container_definitions    = file("./container_definitions.json")
  cpu                      = 256
  memory                   = 512
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  tags = {
    "Name" = "terraform"
  }
}


