resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = var.service_name
  cpu                      = var.container_cpu
  memory                   = var.container_memory
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn


  container_definitions = jsonencode(
    [
      {
        "cpu" : var.container_cpu,
        "image" : var.image_repo,
        "memory" : var.container_memory,
        "name" : var.service_name
        "portMappings" : [
          {
            "containerPort" : var.container_port,
          }
        ]
      }
  ])
}