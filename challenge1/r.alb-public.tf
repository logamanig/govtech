module "alb_public" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = var.alb_name

  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
  security_groups = [aws_security_group.fargate_container_sg.id]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "ip"
      targets = [
        # {
        #   target_id = "fargate-ecs-service-target"
        #   port      = 3000
        # }
      ]
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}

resource "aws_security_group" "fargate_container_sg" {
  description = "Allow access to the public facing load balancer"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "Ingress from the public ALB"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "Ingress from the private ALB"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

  }
  ingress {
    description = "Ingress from other containers in the same security group"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}