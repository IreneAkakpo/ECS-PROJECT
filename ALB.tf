# Creating target group
resource "aws_lb_target_group" "ALB-Target-group" {
  health_check {
    interval            = 200
    path                = "/"
    protocol            = "HTTP"
    timeout             = 60
    healthy_threshold   = 5
    unhealthy_threshold = 5
  }

  name        = var.target-group-name
  target_type = var.target_type
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.ECS-VPC.id

  tags = {
    Name = var.environment_name
  }
}

#Creating Internet-facing ALB 
resource "aws_lb" "ECS-ALB" {
  name               = var.load_balancer_name
  internal           = var.internal
  ip_address_type    = var.ip_address_type
  load_balancer_type = var.load_balancer_type
  security_groups    = [aws_security_group.ALB-SG.id]
  /* security_groups = [aws_security_group.DB-SG.id, aws_security_group.ECS-SG.id]  */
  subnets                    = [aws_subnet.public-sub1.id, aws_subnet.public-sub2.id]
  enable_deletion_protection = var.enable_deletion_protection

  tags = {
    name = var.environment_name
  }
}


# Creating listener
# Listener rule for HTTPs traffic on ALB
resource "aws_lb_listener" "alb-listener-https" {
  load_balancer_arn = aws_lb.ECS-ALB.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
  certificate_arn   = aws_acm_certificate.ecs-cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ALB-Target-group.id
  }
}


# Listener rule for HTTP traffic on ALB
resource "aws_lb_listener" "alb-listener-http" {
  load_balancer_arn = aws_lb.ECS-ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ALB-Target-group.id
  }
}

/* #Better to use this instead
  default_action {
    type             = "redirect"

    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code ="HTTP_301"
    }
  }
} */








