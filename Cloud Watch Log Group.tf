### Cloud Watch Log Group ###
resource "aws_cloudwatch_log_group" "nginx" {
  name              = "/ecs/logs/terraform/nginx"
  retention_in_days = 1
}