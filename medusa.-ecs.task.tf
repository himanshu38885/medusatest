resource "aws_ecs_task_definition" "medusa-task" {
  family                = "medusa-task"
  execution_role_arn    = aws_iam_role.ecs_task_role.arn
  task_role_arn         = aws_iam_role.ecs_task_role.arn
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                   = "256"
  memory                = "512"
  container_definitions = jsonencode([{
    name      = "medusa-backend"
    image     = "medusajs/medusa"  # Replace with your own image if customized
    portMappings = [{
      containerPort = 9000
      hostPort      = 9000
      protocol      = "tcp"
    }]
  }])
}
