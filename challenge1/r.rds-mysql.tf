resource "random_password" "db_password" {
  length           = 32
  special          = true
  override_special = "_%@{}<>"
}

module "symbosis_my_sql_db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 3.0"

  identifier = "${var.db_instance_name}-${terraform.workspace}"

  engine            = "mysql"
  engine_version    = var.my_sql_engine_version
  instance_class    = var.my_sql_instance_class
  allocated_storage = var.my_sql_allocated_storage

  name     = var.db_instance_name
  username = var.my_sql_username
  password = random_password.db_password.result
  port     = var.my_sql_port

  # set monitoring interval to 0 to disable
  monitoring_interval = 0

  iam_database_authentication_enabled = var.my_sql_iam_database_authentication_enabled

  vpc_security_group_ids = [module.vpc.default_security_group_id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # DB subnet group
  create_db_subnet_group = false
  db_subnet_group_name   = module.vpc.database_subnet_group_name
  subnet_ids             = module.vpc.database_subnets

  # DB parameter group
  family = var.my_sql_parameter_group_family

  # DB option group
  major_engine_version = var.my_sql_major_engine_version

  # Database Deletion Protection
  deletion_protection = var.my_sql_deletion_protection

  parameters = [
    {
      name  = "character_set_client"
      value = "utf8mb4"
    },
    {
      name  = "character_set_server"
      value = "utf8mb4"
    }
  ]
}
