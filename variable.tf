#Making Region name variable
variable "region-name" {
  description = "making region name a variable"
  default     = "eu-west-2"
  type        = string

}

#Making VPC Name/tag variable
variable "vpc_name" {
  description = "making vpc-name a variable"
  default     = "Project-VPC"
  type        = string

}

#Making Cidr block variable
variable "cidr-for-vpc" {
  description = "making cidr a variable"
  default     = "10.0.0.0/16"
  type        = string

}

#Making Cidr block variable
variable "instance-tenancy" {
  description = "making instance tenancy a variable"
  default     = "default"
  type        = string

}

#Making DNS hostnames variable
variable "enable_dns_hostnames" {
  description = "making enable dns hostnames a variable"
  default     = "true"
  type        = bool

}

#Making DNS support variable
variable "enable_dns_support" {
  description = "making enable dns support a variable"
  default     = "true"
  type        = bool

}

#Making Tag Name support variable
variable "environment_name" {
  description = "making environment tag name a variable"
  default     = "Development"
  type        = string

}


# Availability Zone Variable 1
variable "AZ-1" {
  description = "making availability zone A a variable"
  default     = "eu-west-2a"
  type        = string
}


# Availability Zone Variable 2
variable "AZ-2" {
  description = "making availability zone B a variable"
  default     = "eu-west-2b"
  type        = string
}

# Public subnet1 variable
variable "cidr-for-public-sub1" {
  description = "making public subnet1 cidr a variable"
  default     = "10.0.1.0/24"
  type        = string

}

# Public subnet2 variable
variable "cidr-for-public-sub2" {
  description = "making public subnet2 cidr a variable"
  default     = "10.0.2.0/24"
  type        = string

}

# Private subnet1 variable
variable "cidr-for-private-sub1" {
  description = "making private subnet1 cidr a variable"
  default     = "10.0.3.0/24"
  type        = string

}

# Private subnet2 variable
variable "cidr-for-private-sub2" {
  description = "making private subnet1 cidr a variable"
  default     = "10.0.4.0/24"
  type        = string

}

# Internet Gateway Name/tag variable
variable "internet_gateway_name" {
  description = "making IGW-name a variable"
  default     = "Project-IGW"
  type        = string

}


#EIP for VPC status
variable "EIP" {
  description = "making eip for vpc a variable"
  default     = "true"
  type        = bool

}

# ALB Security group name variable 
variable "ALB_SG_name" {
  description = "making security group name a variable"
  default     = "ALB-SG"
  type        = string

}

# ALB Ingress port name variable 
variable "alb_ingress_port" {
  description = "making alb ingress port a variable a variable"
  default     = 80
  type        = number

}


# ECS Service Security group name variable 
variable "ECS_SG_name" {
  description = "making security group name a variable"
  default     = "ECS-SG"
  type        = string

}

# ECS Ingress port name variable 
variable "ecs_ingress_port" {
  description = "making ecs ingress port a variable a variable"
  default     = 80
  type        = number

}


# RDS Postgres Security group name variable 
variable "DB_SG_name" {
  description = "making security group name a variable"
  default     = "DB-SG"
  type        = string

}

# DB Ingress port name variable 
variable "DB_ingress_port" {
  description = "making DB ingress port a variable a variable"
  default     = 5432
  type        = number

}

#RDS POSTGRES VARIABLES

variable "rds_subnet_group_name" {
  description = "making rds_subnet_group_name a variable"
  default     = "rds_postgres_subnet_group"
  type        = string
}

variable "rds_allocated_storage" {
  description = "making rds allocated_storage a variable"
  default     = 10
  type        = number
}

/* variable "rds_db_name" {
  description = "making rds db_name a variable"
  default     = "mydb"
  type        = string
} */

variable "rds_engine_version" {
  description = "making rds engine_version a variable"
  default     = "13.7"
  type        = string
}

variable "rds_instance_class" {
  description = "making rds instance_class a variable"
  default     = "db.t3.micro"
  type        = string
}

variable "rds_username" { #safer to keep in aws secret manager
  description = "making rds username a variable"
  default     = "Rennie"
  type        = string
  /* sensitive   = true */

}

variable "rds_password" { #safer to keep in aws secret manager
  description = "making rds password a variable"
  default     = "wordpass"
  type        = string
  /* sensitive   = true */

}

variable "rds_storage_type" {
  description = "making rds storage_type a variable"
  default     = "gp2"
  type        = string
}

variable "rds_publicly_accessible" {
  description = "making rds publicly_accessible a variable"
  default     = false
  type        = bool
}

variable "rds_skip_final_snapshot" {
  description = "making rds skip_final_snapshot a variable"
  default     = true
  type        = bool
}

variable "multi-az-deployment" {
  description = "create a standby DB instance"
  default     = true
  type        = bool
}


# Load balancer target group name a variable
variable "target-group-name" {
  description = "making target group name a variable"
  default     = "ALB-TG"
  type        = string
}


# Target group target-type a variable
variable "target_type" {
  description = "making target group target_type a variable"
  default     = "ip"
  type        = string
}

# Load balancer name a variable
variable "load_balancer_name" {
  description = "making Load balancer name a variable"
  default     = "ECS-ALB"
  type        = string
}

# Internal facing Load balancer variable
variable "internal" {
  description = "making internal facing a variable"
  default     = false
  type        = bool

}

# Load balancer ip_address_type a variable
variable "ip_address_type" {
  description = "making alb ip_address_type a variable"
  default     = "ipv4"
  type        = string
}

# Load balancer type a variable
variable "load_balancer_type" {
  description = "making load_balancer_type a variable"
  default     = "application"
  type        = string
}


#Deletion protection variable
variable "enable_deletion_protection" {
  description = "making enable_deletion_protection a variable"
  default     = false
  type        = bool

}

/* # ALB HTTPS listener port a variable 
variable "alb_listener_port" {
  description = "making ALB listener port a variable"
  default     = null
  type        = string

}

# ALB listener HTTPS protocol variable 
variable "alb_listener_protocol" {
  description = "making ALB listener Protocol a variable "
  default     = null
  type        = string

}

# SSL Policy variable 
variable "ssl_policy" {
  description = "making ssl_policy a variable"
  default     = null
  type        = string

}

# Certificate arn variable 
variable "certificate_arn" {
  description = "making certificate_arn a variable a variable"
  default     = null
  type        = string

} */