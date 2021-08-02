module "fargate" {
  source = "./modules/fargate"

  ecs_cluster_name                 = "${var.ecs_cluster_name}-${teraform.workspace}"
  container_insights_enabled       = var.container_insights_enabled
  private_subnet_ids               = module.vpc.private_subnets
  vpc_id                           = module.vpc.vpc_id
  public_target_group_arn          = module.alb_public.target_group_arns[0]
  fargate_public_security_group_id = aws_security_group.fargate_container_sg.id
  db_host                          = module.symbosis_my_sql_db.db_instance_address
  db_port                          = module.symbosis_my_sql_db.db_instance_port
  db_user                          = module.symbosis_my_sql_db.db_instance_username
  db_pwd                           = module.symbosis_my_sql_db.db_instance_password
  db_name                          = module.symbosis_my_sql_db.db_instance_name
}
