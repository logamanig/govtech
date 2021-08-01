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
  default     = 500
}

variable "image_repo" {
  description = "The docker image repository"
  default     = "logamani/symbiosis"
}

variable "container_port" {
  description = "The container port"
  default     = 3000
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
  type = string
  description = "The VPC id"
}

variable "public_target_group_arn" {
  type = string
  description = "The public target group arn"
}