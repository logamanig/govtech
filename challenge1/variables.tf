variable "resource_group_name" {
  description = "Name of the Resource group."
  default     = "symbiosis"
  type        = string
}

variable "tf_release_version" {
  description = "Git release version that corresponds to the terraform deployment"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr_range" {
  description = "CIDR range of the VPC"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones for the VPC"
  type        = list(string)
}

variable "private_subnets" {
  description = "CIDR ranges for the private subnets"
  type        = list(string)
}

variable "database_subnets" {
  description = "CIDR ranges for the database subnets"
  type        = list(string)
}

variable "public_subnets" {
  description = "CIDR ranges for the public subnets"
  type        = list(string)
}

variable "db_instance_name" {
  description = "Name of the database instance"
}

variable "my_sql_engine_version" {
  description = "MySQL engine version"
  default     = "5.7.34"
}

variable "my_sql_username" {
  description = "MySQL username"
  default     = "symbiosis"
}

variable "my_sql_port" {
  description = "MySQL port"
  default     = "3306"
}

variable "my_sql_iam_database_authentication_enabled" {
  description = "MySQL IAM database authentication enabled"
  default     = "true"
}

variable "my_sql_parameter_group_family" {
  description = "MySQL parameter group family"
  default     = "mysql5.7"
}

variable "my_sql_major_engine_version" {
  description = "MySQL major engine version"
  default     = "5.7"
}

variable "my_sql_deletion_protection" {
  description = "MySQL deletion protection"
  default     = "false"
}

variable "my_sql_instance_class" {
  description = "MySQL instance class"
  default     = "db.t2.micro"
}

variable "my_sql_allocated_storage" {
  description = "MySQL allocated storage"
  default     = "5"
}

variable "alb_name" {
  description = "Name of the ALB"
  default     = "symbiosis-alb"
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  default     = "symbiosis-fargate"
}

# enable container insights
variable "container_insights_enabled" {
  description = "Enable container insights"
  default     = "false"
}
