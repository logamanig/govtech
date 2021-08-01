module "fargate" {
  source = "./modules/fargate"

  ecs_cluster_name           = var.ecs_cluster_name
  container_insights_enabled = var.container_insights_enabled
  private_subnet_ids         = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id
  public_target_group_arn = module.alb_public.target_group_arns[0]
}
