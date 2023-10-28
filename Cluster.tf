## ECS Cluster ##
resource "aws_ecs_cluster" "terraform_cluster" {
    name = "terraform_cluster"
}

resource "aws_ecs_cluster_capacity_providers" "provider" {
  cluster_name       = aws_ecs_cluster.terraform_cluster.name
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]
}