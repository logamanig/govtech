resource "aws_ecs_service" "ecs_service" {
  name                               = var.service_name
  cluster                            = module.ecs_cluster.ecs_cluster_id
  # launch_type                        = "FARGATE"
  deployment_maximum_percent         = "200"
  deployment_minimum_healthy_percent = "75"
  desired_count                      = var.desired_count

  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [var.fargate_public_security_group_id]
  }

  capacity_provider_strategy {
    base              = 1
    capacity_provider = "FARGATE_SPOT"
    weight            = 1
  }

  lifecycle {
    ignore_changes = [desired_count]
  }

  # Track the latest ACTIVE revision
  task_definition = "${aws_ecs_task_definition.ecs_task_definition.family}:${max(aws_ecs_task_definition.ecs_task_definition.revision, aws_ecs_task_definition.ecs_task_definition.revision)}"

  load_balancer {
    target_group_arn = var.public_target_group_arn
    container_name   = var.service_name
    container_port   = var.container_port
  }
}