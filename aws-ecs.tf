resource "aws_ecs_service" "medusa-service" {
  name            = "medusa-service"
  cluster         = aws_ecs_cluster.medusa-cluster.id
  task_definition = aws_ecs_task_definition.medusa-task.arn
  desired_count   = 1 

  launch_type = "FARGATE"

  network_configuration {
    subnets          = [aws_subnet.main.id]
    assign_public_ip = true
  }
}
