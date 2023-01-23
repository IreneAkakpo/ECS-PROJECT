# Configuring internet-facing Load balancer Security Group
resource "aws_security_group" "ALB-SG" {
  name        = var.ALB_SG_name
  description = "Allow HTTP and HTTPS inbound traffic"
  vpc_id      = aws_vpc.ECS-VPC.id

  # Inbound Rules
  ingress {
    description = "HTTP from VPC"
    from_port   = var.alb_ingress_port
    to_port     = var.alb_ingress_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Ingress rule meant for production environment, it has been made a variable and can be found in prod.tfvars
  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #in theory this could be done for a 2 tier architecture
  /* ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.DB-SG.id]
  } */

  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.environment_name
  }
}


# Configuring ESC Service Security Group 
resource "aws_security_group" "ECS-SG" {
  name        = var.ECS_SG_name
  description = "Allow inbound traffic from ALB-SG"
  vpc_id      = aws_vpc.ECS-VPC.id

  # Inbound Rules
  ingress {
    from_port       = var.ecs_ingress_port
    to_port         = var.ecs_ingress_port
    protocol        = "tcp"
    security_groups = [aws_security_group.ALB-SG.id]
  }

  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.environment_name
  }
}


# Configuring RDS Postgres Security Group
resource "aws_security_group" "DB-SG" {
  name        = var.DB_SG_name
  description = "Allow inbound traffic from ECS-SG"
  vpc_id      = aws_vpc.ECS-VPC.id

  ingress {
    from_port       = var.DB_ingress_port
    to_port         = var.DB_ingress_port
    protocol        = "tcp"
    security_groups = [aws_security_group.ECS-SG.id]
  }

  tags = {
    Name = var.environment_name
  }
}