module "ecs_cluster" {
  source = "terraform-aws-modules/ecs/aws"

  name               = var.ecs_cluster_name
  container_insights = var.container_insights_enabled
  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy = [
    {
      capacity_provider = "FARGATE_SPOT"
    }
  ]
}