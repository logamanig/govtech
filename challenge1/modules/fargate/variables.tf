variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
}

variable "container_insights_enabled" {
  description = "Enable container insights"
  default     = "false"
}

variable "service_name" {
  description = "Name of the ECS service"
  default     = "symbiosis-service"
}

variable "container_cpu" {
  description = "CPU share for the container"
  default     = 256
}

variable "container_memory" {
  description = "Memory limit for the container"
  default     = 512
}

variable "image_repo" {
  description = "The docker image repository"
  default     = "logamani/symbiosis"
}

variable "container_port" {
  description = "The container port"
  default     = 3000
}

variable "host_port" {
  description = "The host port"
  default     = 80
}

variable "desired_count" {
  description = "Desired count of the service"
  default     = 1
}

variable "private_subnet_ids" {
  description = "The private subnet ids"
  type        = list(string)
}

variable "vpc_id" {
  type        = string
  description = "The VPC id"
}

variable "public_target_group_arn" {
  type        = string
  description = "The public target group arn"
}

variable "db_host" {
  description = "The database host"
  sensitive = true
}

variable "db_user" {
  description = "The database user"
  sensitive = true
}

variable "db_pwd" {
  description = "The database password"
  sensitive = true
}

variable "db_name" {
  description = "The database name"
  sensitive = true
}

variable "db_port" {
  description = "The database port"
  default     = 3306
  sensitive = true
}