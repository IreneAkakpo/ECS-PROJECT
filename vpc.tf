# Creating a VPC
resource "aws_vpc" "ECS-VPC" {
  cidr_block           = var.cidr-for-vpc
  instance_tenancy     = var.instance-tenancy
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = {
    Name = var.environment_name
  }
}

