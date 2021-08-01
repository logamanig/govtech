resource "aws_security_group" "fargate_container_sg" {
  description = "Allow access to the public facing load balancer"
  vpc_id      = var.vpc_id

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